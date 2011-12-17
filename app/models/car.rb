class Car < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  validates :vin, :length => { :within => 17..17 }, :allow_blank => true
  
  has_many :car_assets, :as => :attachable#, :dependent => :destroy  
  accepts_nested_attributes_for :car_assets,
                                :allow_destroy => true,
                                :reject_if => lambda { |attrs| attrs['file'].blank? }
end
