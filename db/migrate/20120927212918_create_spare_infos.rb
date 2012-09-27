class CreateSpareInfos < ActiveRecord::Migration
  def change
    create_table :spare_infos do |t|
      t.string :catalog_number
      t.string :manufacturer
      t.text :description

      t.timestamps
    end
  end
end
