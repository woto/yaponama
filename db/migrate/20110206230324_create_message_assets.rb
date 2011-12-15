class CreateMessageAssets < ActiveRecord::Migration
  def self.up
    create_table :message_assets do |t|
      t.string :message_asset_file_name
      t.string :message_asset_content_type
      t.integer :message_asset_file_size
      t.datetime :message_asset_updated_at
      t.references :message
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :message_assets
  end
end
