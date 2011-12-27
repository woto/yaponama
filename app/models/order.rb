class Order < ActiveRecord::Base
  has_many :wishes, :dependent => :destroy
  belongs_to :user
end
