class AddNameToParts < ActiveRecord::Migration
  def change
    add_column :parts, :name, :string
  end
end
