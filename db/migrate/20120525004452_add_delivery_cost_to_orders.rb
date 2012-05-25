class AddDeliveryCostToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_cost, :integer
  end
end
