class Checkout 
  include ActiveAttr::Model
  attribute :fio
  attribute :address

  #validates_presence_of :address
end
