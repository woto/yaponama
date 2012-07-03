class AddPaymentFlagsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :paid1, :boolean
    add_column :orders, :paid2, :boolean
  end
end
