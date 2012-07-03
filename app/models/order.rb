class Order < ActiveRecord::Base
  include UserOrAdmin
    
  has_many :wishes, :dependent => :destroy
  belongs_to :user
  
  enum_attr :status, %w{awaiting processed}

  validates :delivery_cost, :numericality => { :only_integer => true }, :allow_nil => true

  def robokassa_summary
    wishes.each.map {|wish| wish.catalog_number}.join(', ')
  end

  def sum
    sum = 0

    wishes.each do |wish|
      sum += (multiply = wish.cost * wish.count_in_wishes)
    end

    sum += delivery_cost.to_i
  end
  
end
