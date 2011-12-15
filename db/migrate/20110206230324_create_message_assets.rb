class CreateMessageAssets < ActiveRecord::Migration
  def self.up
    create_table :message_assets do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at
      t.references :message
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :message_assets
  end
end
