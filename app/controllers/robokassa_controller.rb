class RobokassaController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  protect_from_forgery :except => [:result] 

  def success
    debugger
    Rails.logger.debug('ROBOKASSA FAIL')
    Rails.logger.debug('----------------')
    Rails.logger.debug(params.inspect)
    notify = Robokassa.notification request.raw_post, :secret => APP_CONFIG['robokassa_pass_1']
    if notify.acknowledge
      @order = Order.find(notify.item_id)
      if @order.sum == notify.amount
        @order.paid2 = true
        @order.save
      end
      flash[:notice] = notify.acknowledge.to_s
      redirect_to root_path
    end
    Rails.logger.debug('----------------')
  end

  def fail
    debugger
    Rails.logger.debug('ROBOKASSA FAIL')
    Rails.logger.debug('----------------')
    Rails.logger.debug(params.inspect)
    flash[:notice] = "Оплата завершилась неудачей."
    redirect_to root_path
    Rails.logger.debug('----------------')
  end

  def result
    debugger
    Rails.logger.debug('ROBOKASSA RESULT')
    Rails.logger.debug('----------------')
    Rails.logger.debug(params.inspect)
    notify = Robokassa.notification request.raw_post, :secret => APP_CONFIG['robokassa_pass_2']
    Rails.logger.debug("Amount: #{notify.amount}")
    Rails.logger.debug("Item ID: #{notify.item_id}")
    Rails.logger.debug('----------------')

    # 1. Проверяются ключи
    # 2. Безусловный true
    # 3. Тут самый важный момент - notify.acknowledge
    # Надо получить неоплаченные заказы с notify.order_id и сравнить цену
    if Robokassa::Notification.recognizes?(params) and notify.complete? and notify.acknowledge
      @order = Order.find(notify.item_id)
      if @order.sum == notify.amount
        @order.paid1 = true
        @order.save
        render :text => notify.success_response and return
      end
    end

    render :text => 'Error' and return
  end

end
