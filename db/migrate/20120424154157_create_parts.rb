class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.text :content

      t.timestamps
    end
  end
end
