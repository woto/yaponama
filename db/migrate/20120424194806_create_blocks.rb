class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.text :content
      t.string :block_name

      t.timestamps
    end
  end
end
