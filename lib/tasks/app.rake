namespace :app do
  desc "Разослать смс с новыми сообщениями"
  task :notify => :environment do

    # Заказы
    orders = Order.where(:notified => false).where("created_at < ?", 10.minutes.ago)
    orders.each do |order|
      unless order.user.admin? 
        User.where(:admin => true).each do |admin|
          data = {
            :destinationAddress => admin.phone,
            :messageData => "#{order.user.user_name} с тел. +7#{order.user.phone} сделал заказ №#{order.id}"
          }
          SmsSender.new.notify(data)
        end 
      end
    end
    
    if orders.present?
      orders.update_all(:notified => true)
    end

    # Отправить уведомление топикстартеру если он не админ
    messages = Message.where(:notified => false).where("created_at < ?", 10.minutes.ago)
    messages.each do |message|
      if message.user.admin? && !message.request.user.admin?
        data = {
          :destinationAddress => message.request.user.phone,
          :messageData => "Поступил ответ на ваш запрос № #{message.request.id}"
        }
        SmsSender.new.notify(data)
      # Иначе менеджеру
      elsif !message.user.admin?
        User.where(:admin => true).each do |user|
          data = {
            :destinationAddress => user.phone,
            :messageData => "#{message.request.user.user_name} с тел. +7#{message.request.user.phone}, запрос №#{message.request.id}"
          }
          SmsSender.new.notify(data)
        end
      end
    end

    if messages.present?
      messages.update_all(:notified => true)
    end

  end
end
