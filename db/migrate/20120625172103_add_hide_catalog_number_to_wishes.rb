class AddHideCatalogNumberToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :hide_catalog_number, :boolean
  end
end
