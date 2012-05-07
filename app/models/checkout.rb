class Checkout 
  include ActiveAttr::Model
  attribute :fio
  attribute :address
  attribute :account

  #validates_presence_of :address
end
