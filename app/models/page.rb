class Page < ActiveRecord::Base
  before_save :cut_first_slash

  def cut_first_slash
    self.path = self.path.gsub(/^\/+/, '')
  end
end
