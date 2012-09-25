class CreateToyotaEpcPartNumberApplicationToModelsParents < ActiveRecord::Migration
  def change
    create_table :toyota_epc_part_number_application_to_models_parents do |t|
      t.string :part_number
      t.string :region_area

      t.timestamps
    end
  end
end
