class Car < ActiveRecord::Base
  belongs_to :user
  validates :vin, :length => { :within => 17..17 }, :allow_blank => true
end
