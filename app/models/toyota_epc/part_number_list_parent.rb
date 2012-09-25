module ToyotaEpc
  class PartNumberListParent < ActiveRecord::Base
    has_many :part_number_list_child, :class_name => "ToyotaEpc::PartNumberListChild"
  end
end
