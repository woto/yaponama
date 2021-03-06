class User < ActiveRecord::Base

  cattr_accessor :is_session_admin_workaround 

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]

  attr_accessible :balance, :discount, :as => :admin

  # Setup accessible (or protected) attributes for your model
  attr_accessible :phone, :password, :password_confirmation, :remember_me, :name, :email, :user_name, :as => [:default, :admin]
  attr_accessible :humanizer_question_id, :humanizer_answer, :as => [:default, :admin]

  attr_accessible :confirmation_token, :as => [:default, :admin]


  #TODO!
  attr_accessible :captcha, :captcha_key, :as => [:default, :admin]

  
  # Проверка телефона
  validates :phone, :numericality => { :only_integer => true }, :length => { :within => 10..10 }, :uniqueness => true
  
  # Проверка имени пользователя, только в случае если он не находится на 
  # первом шаге регистрации (другими словами confirmation_token уже установлен)
  validates :user_name, :presence => true, :if => :confirmation_token_setted

  apply_simple_captcha
  
  has_many :cars, :dependent => :destroy
  has_many :wishes, :dependent => :destroy
  has_many :links, :dependent => :destroy

  def confirmation_token_setted
    # Если уже выставлен confirmation_token (на insert не 
    # производится изменения этой модели) или уже
    # подтверждал свой аккаунт
    confirmation_token? || confirmed_at?
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    yield
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    update_attributes(params, :as => is_session_admin_workaround ? :admin : :default)
  end

  def email_required?
    false
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
