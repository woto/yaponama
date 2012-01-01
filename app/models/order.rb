class Order < ActiveRecord::Base
  include UserOrAdmin
    
  has_many :wishes, :dependent => :destroy
  belongs_to :user
  
  enum_attr :status, %w{awating processed}
  
  after_create :notify
  
  def notify
    unless user.admin? 
      User.where(:admin => true).each do |admin|
        data = {
          :destinationAddress => admin.phone,
          :messageData => "#{user.user_name} с тел. +7#{user.phone} сделал заказ №#{id}"
        }
        SmsSender.new.notify(data)
      end        
    end
  end
  
end
