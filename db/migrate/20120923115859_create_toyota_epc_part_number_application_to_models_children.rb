class CreateToyotaEpcPartNumberApplicationToModelsChildren < ActiveRecord::Migration
  def change
    create_table :toyota_epc_part_number_application_to_models_children do |t|
      t.string :region_area
      t.string :part_number
      t.string :part_name_code
      t.string :qty
      t.string :catalog
      t.string :model_name
      t.string :fr_to
      t.string :models_description
      t.references :part_number_application_to_models_parent

      t.timestamps
    end
  end
end
