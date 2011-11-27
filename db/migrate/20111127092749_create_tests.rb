class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title

      t.timestamps
    end
  end
end
