class CarAsset < ActiveRecord::Base
  belongs_to :car
  belongs_to :user
  
  belongs_to :attachable, :polymorphic => true
  mount_uploader :file, CommonAssetUploader
end