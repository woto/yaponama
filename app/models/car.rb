class Car < ActiveRecord::Base
  include UserOrAdmin
  
  has_many :car_assets, :as => :attachable, :dependent => :destroy  
  accepts_nested_attributes_for :car_assets,
                                :allow_destroy => true,
                                :reject_if => lambda { |attrs| attrs['file'].blank? }
end
