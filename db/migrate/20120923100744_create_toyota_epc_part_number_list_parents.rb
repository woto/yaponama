class CreateToyotaEpcPartNumberListParents < ActiveRecord::Migration
  def change
    create_table :toyota_epc_part_number_list_parents do |t|
      t.string :part_name_code
      t.string :part_name
      t.string :region_area

      t.timestamps
    end
  end
end
