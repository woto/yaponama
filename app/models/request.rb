class Request < ActiveRecord::Base
  belongs_to :car
  has_many :messages
  
  accepts_nested_attributes_for :messages, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }  
  
end
