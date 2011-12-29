class Wish < ActiveRecord::Base
  
  include GuestOrUser
  
  belongs_to :user
  belongs_to :wish
  
  enum_attr :status, %w{active inactive ordered}
  
  validates :count_in_wishes, :numericality => {:only_integer => true}
  
  # TODO перед апдейтом этого сделать к сожалению не получается
  # а around_update и вовсе заставил испугаться
  after_save :delete_zero_or_less
  
  def delete_zero_or_less
    self.destroy if self.count_in_wishes <= 0
  end
  
end
