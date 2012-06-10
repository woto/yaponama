class CallbackRequest < ActiveRecord::Base
  validates :phone, :numericality => { :only_integer => true}, :length => { :within => 10..10}
end
