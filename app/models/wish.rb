class Wish < ActiveRecord::Base
  
  include ScopeForUser
  
  belongs_to :user
  validates :count_in_wishes, :numericality => {:only_integer => true}
  
  # TODO перед апдейтом этого сделать к сожалению не получается
  # а around_update и вовсе заставил испугаться
  after_save :delete_zero_or_less
  
  def delete_zero_or_less
    self.destroy if self.count_in_wishes <= 0
  end
end
