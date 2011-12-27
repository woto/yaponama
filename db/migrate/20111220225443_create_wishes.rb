class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :user_id, :nil => true
      t.integer :cost
      t.string :catalog_number
      t.string :manufacturer
      t.string :title
      t.string :count
      t.string :declared
      t.string :average
      t.string :country
      t.string :session_id
      t.enum :status, :default => "active"      
      t.integer :order_id
      t.integer :count_in_wishes, :default => 0

      t.timestamps
    end
  end
end
