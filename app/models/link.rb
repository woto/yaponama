class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :presence => true
  validates :template_to_search, :presence => true
end
