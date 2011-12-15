class Car < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  has_many :car_assets#, :dependent => :destroy
  validates :vin, :length => { :within => 17..17 }, :allow_blank => true
  accepts_nested_attributes_for :car_assets, :allow_destroy => true
end
