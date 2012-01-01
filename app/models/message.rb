class Message < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  has_many :message_assets, :dependent => :destroy
  accepts_nested_attributes_for :message_assets,
                                :allow_destroy => true,
                                :reject_if => lambda { |attrs| attrs['file'].blank? }
  scope :last_message, lambda { |request_id| joins(:request).order("messages.id DESC").where(:requests => { :id => request_id }).limit(1) }                                

  after_create :notify
  
  def notify
    # Отправить уведомление топикстартеру если он не админ
    if user.admin? && !request.user.admin?
      data = {
        :destinationAddress => request.user.phone,
        :messageData => "Поступил ответ на ваш запрос № #{request.id}"
      }
      SmsSender.new.notify(data)
    # Иначе менеджеру
    elsif !user.admin?
      User.where(:admin => true).each do |user|
        data = {
          :destinationAddress => user.phone,
          :messageData => "#{request.user.user_name} с тел. +7#{request.user.phone}, запрос №#{request.id}"
        }
        SmsSender.new.notify(data)
      end
    end

  end


end