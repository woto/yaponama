class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.enum :status, :default => "awating"
      t.references :user
      t.timestamps
    end
  end
end
