class CarAsset < ActiveRecord::Base
  belongs_to :car
  belongs_to :user
  has_attached_file :car_asset, :styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100>" }
end
