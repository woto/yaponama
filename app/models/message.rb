class Message < ActiveRecord::Base
  belongs_to :request
  has_many :message_assets
  accepts_nested_attributes_for :message_assets, :allow_destroy => true, :reject_if => lambda { |attrs| attrs['file'].blank? }
end
