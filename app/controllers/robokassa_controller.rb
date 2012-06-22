class RobokassaController < ApplicationController

  require 'active_merchant/billing/integrations/action_view_helper'
  ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

  Order = Struct.new(:id, :price, :name, :items_summary)     #=> Customer
  CurrentUser = Struct.new(:name, :surname, :email)

  def new
    # Create a structure with a name in Struct
    #Struct.new("Customer", :name, :address)    #=> Struct::Customer
    #Struct::Customer.new("Dave", "123 Main")   #=> #<Struct::Customer name="Dave", address="123 Main">

    # Create a structure named by its constant
    #Customer.new("Dave", "123 Main")           #=> #<Customer name="Dave", address="123 Main">
    @order = Order.new(1, 100, 'woto', 1)
    @current_paypal_user = CurrentUser.new('woto', 'Kornev', 'oganer@gmail.com')
  end
end
