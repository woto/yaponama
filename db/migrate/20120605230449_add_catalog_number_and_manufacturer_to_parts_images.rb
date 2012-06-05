class AddCatalogNumberAndManufacturerToPartsImages < ActiveRecord::Migration
  def change
    add_column :parts_images, :catalog_number, :string
    add_column :parts_images, :manufacturer, :string
  end
end
