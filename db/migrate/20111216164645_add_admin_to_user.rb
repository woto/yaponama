class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    
    add_index :users, :admin
  end
end
