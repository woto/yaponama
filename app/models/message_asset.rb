class MessageAsset < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  has_attached_file :message_asset, :styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100>" }
end