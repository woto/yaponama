class Order < ActiveRecord::Base
  include UserOrAdmin
    
  has_many :wishes, :dependent => :destroy
  belongs_to :user
  
  enum_attr :status, %w{awaiting processed}

  validates :delivery_cost, :numericality => { :only_integer => true }, :allow_nil => true
  
end
