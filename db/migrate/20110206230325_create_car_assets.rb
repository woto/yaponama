class CreateCarAssets < ActiveRecord::Migration
  def self.up
    create_table :car_assets do |t|
      t.string :file
      t.references :attachable, :polymorphic => true
      t.references :user
      t.references :car

      t.timestamps
    end
  end

  def self.down
    drop_table :car_assets
  end
end
