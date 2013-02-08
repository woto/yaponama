class AddInvisibleContentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :invisible_content, :text
  end
end
