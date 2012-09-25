class ToyotaEpc::PartNumberApplicationToModelsChild < ActiveRecord::Base
  belongs_to :part_number_application_to_models_parent
end
