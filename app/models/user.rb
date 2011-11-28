class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :phone, :password, :password_confirmation, :remember_me, :name
  attr_accessible :humanizer_question_id, :humanizer_answer

  validates :phone, :numericality => { :only_integer => true }, :length => {:is => 10}, :uniqueness => true
  validates :name, :presence => true

  def email_required?
    false
  end

  include Humanizer
  require_human_on :create

end
