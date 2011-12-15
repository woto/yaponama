class CreateMessageAssets < ActiveRecord::Migration
  def self.up
    create_table :message_assets do |t|
      t.string :file
      t.references :attachable, :polymorphic => true
      t.references :message
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :message_assets
  end
end
