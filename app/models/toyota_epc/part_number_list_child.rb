module ToyotaEpc
  class PartNumberListChild < ActiveRecord::Base
    belongs_to :part_number_list_parent, :class_name => "ToyotaEpc::PartNumberListParent"
  end
end
