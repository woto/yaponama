class AddOrderIdToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :order_id, :integer
  end
end
