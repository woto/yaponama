class NotificationsController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  protect_from_forgery :except => [:create, :paypal_return] 

  # This action is for when the buyer returns to your site from PayPal
  def paypal_return
    flash[:notice] = "Thanks for buying this!"
    redirect_to root_path
  end

  # This action is for when the buyer cancels
  def paypal_cancel
    flash[:notice] = "We're sorry you didn't buy :("
    redirect_to root_path
  end

  # This is what will receive the IPN from PayPal
  def create
    # You maybe want to log this notification
    notify = Paypal::Notification.new request.raw_post
    @order = Order.unpaid.find(notify.item_id)

    if notify.acknowledge
      # Make sure you received the expected payment!
      if notify.complete? and @order.price == BigDecimal.new( params[:mc_gross] )
        # All your bussiness logic goes here
        @order.update_attributes(:paid => true)
        render :nothing => true
      end
    rescue
      #Make sure you log the exceptions you have.
    end
  end
end
