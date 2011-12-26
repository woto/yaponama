class AddActiveToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :active, :boolean, :default => true
  end
end
