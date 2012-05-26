class CreatePartsImages < ActiveRecord::Migration
  def change
    create_table :parts_images do |t|
      t.string :part_image

      t.timestamps
    end
  end
end
