class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.enum :status, :default => "awaiting"
      t.text :notes
      t.boolean :notified, :default => false
      t.references :user
      t.timestamps
    end
  end
end
