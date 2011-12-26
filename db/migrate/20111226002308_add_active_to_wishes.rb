class AddActiveToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :active, :boolean
  end
end
