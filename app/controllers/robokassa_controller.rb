class RobokassaController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  protect_from_forgery :except => [:result] 

  require 'active_merchant/billing/integrations/action_view_helper'
  ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

  Order = Struct.new(:id, :price, :name, :items_summary, :description)     #=> Customer
  CurrentUser = Struct.new(:name, :surname, :email)


  def success
    Rails.logger.debug(params.inspect)
    notify = Robokassa.notification request.raw_post, :secret => APP_CONFIG['robokassa_pass_1']
    if notify.acknowledge
      flash[:notice] = notify.acknowledge.to_s
      redirect_to root_path
    end
  end

  def fail
    Rails.logger.debug(params.inspect)
    flash[:notice] = "We're sorry you didn't buy :("
    redirect_to root_path
  end

  def result
    Rails.logger.debug(params.inspect)
    # You maybe want to log this notification
    notify = Robokassa.notification request.raw_post, :secret => APP_CONFIG['robokassa_pass_2']
    Rails.logger.debug("Amount: #{notify.amount}")
    # 1. Проверяются ключи
    # 2. Безусловный true
    # 3. Тут самый важный момент - notify.acknowledge
    # Надо получить неоплаченные заказы с notify.order_id и сравнить цену
    if Robokassa::Notification.recognizes?(params) and notify.complete? and notify.acknowledge
      render :text => notify.success_response
    else
      render :text => 'Error'
    end
  end
end
