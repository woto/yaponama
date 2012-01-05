class Order < ActiveRecord::Base
  include UserOrAdmin
    
  has_many :wishes, :dependent => :destroy
  belongs_to :user
  
  enum_attr :status, %w{awating processed}
  
end
