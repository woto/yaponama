class MessageAsset < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  belongs_to :attachable, :polymorphic => true
  mount_uploader :file, CommonAssetUploader
end