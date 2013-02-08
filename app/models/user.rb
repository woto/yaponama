class User < ActiveRecord::Base

  acts_as_easy_captcha
  validate :valid_captcha?, :on => :create

  has_many :spare_infos

  cattr_accessor :is_session_admin_workaround 
  attr_accessor :login
  attr_accessible :login

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessible :balance, :discount, :as => :admin
  attr_accessible :captcha

  # Setup accessible (or protected) attributes for your model
  attr_accessible :phone, :password, :password_confirmation, :remember_me, :name, :email, :user_name, :as => [:default, :admin]
  attr_accessible :humanizer_question_id, :humanizer_answer, :as => [:default, :admin]

  attr_accessible :confirmation_token, :as => [:default, :admin]

  #TODO!
  attr_accessible :captcha, :captcha_key, :as => [:default, :admin]

  
  validates :user_name, :presence => true, :if => :confirmation_token_setted

  has_many :cars, :dependent => :destroy
  has_many :wishes, :dependent => :destroy
  has_many :links, :dependent => :destroy

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  def self.generate_token(column)
    loop do
      token = SecureRandom.base64(15).tr('+/=lIO0LioQq5Ss1', 'abcdefjwhvkmnxzt')[0,5].upcase
      unless (to_adapter.find_first({ "confirmation_token" => token }) || to_adapter.find_first({ "reset_password_token" => token }) )
        break token
      end
    end
  end

end
