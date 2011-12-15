class CreateCarAssets < ActiveRecord::Migration
  def self.up
    create_table :car_assets do |t|
      t.string :car_asset_file_name
      t.string :car_asset_content_type
      t.integer :car_asset_file_size
      t.datetime :car_asset_updated_at
      t.references :user
      t.references :car

      t.timestamps
    end
  end

  def self.down
    drop_table :car_assets
  end
end
