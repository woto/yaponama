class CreateSpareInfos < ActiveRecord::Migration
  def change
    create_table :spare_infos do |t|
      t.string :catalog_number
      t.string :manufacturer
      t.text :default_content
      t.text :mobile_content
      t.references :user

      t.timestamps
    end
    add_index :spare_infos, :user_id
  end
end
