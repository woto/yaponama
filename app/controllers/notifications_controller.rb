class NotificationsController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  protect_from_forgery :except => [:create, :paypal_return] 

  # This action is for when the buyer returns to your site from PayPal
  def paypal_return
    Rails.logger.debug(params.inspect)
    notify = Robokassa.notification request.raw_post, :secret => APP_CONFIG['robokassa_pass_1']
    if notify.acknowledge
      flash[:notice] = notify.acknowledge.to_s
      redirect_to root_path
    end
  end

  # This action is for when the buyer cancels
  def paypal_cancel
    Rails.logger.debug(params.inspect)
    flash[:notice] = "We're sorry you didn't buy :("
    redirect_to root_path
  end

  # This is what will receive the IPN from PayPal
  def create
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

    #@order = Order.unpaid.find(notify.item_id)

    #if notify.acknowledge
    #  begin
    #    # Make sure you received the expected payment!
    #    if notify.complete? and @order.price == BigDecimal.new( params[:mc_gross] )
    #      # All your bussiness logic goes here
    #      @order.update_attributes(:paid => true)
    #      render :nothing => true
    #    end
    #  rescue
    #    #Make sure you log the exceptions you have.
    #  end
    #end
  end
end
