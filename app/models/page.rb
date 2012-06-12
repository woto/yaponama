class Page < ActiveRecord::Base

  before_validation :cut_first_slash

  validates :path, :presence => true

  def cut_first_slash
    self.path = self.path.gsub(/^\/+/, '')
  end
end
