class Pnc
  include ActiveAttr::Model
  attribute :pnc
  attribute :part_number
  attribute :catalog
  attribute :model_name
  attribute :fr_to
  attribute :models_description

  validates :pnc, :presence => true
end
