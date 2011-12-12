class Fake
  def deliver
    nil
  end
end

class SmsSender
  class << self

    def notify_by_growl record
      g = Growl.new "127.0.0.1", "ruby-growl", ["ruby-growl Notification"]
      phone = record.phone.gsub(/^(\d{3})(\d{3})(\d{2})/, '+7 (\1) \2-\3-')
      g.notify "ruby-growl Notification", "Номер #{phone}" , "Код подтверждения: #{record.confirmation_token || record.reset_password_token}"
    end

    def confirmation_instructions(record)
      notify_by_growl record
      Fake.new
    end

    def reset_password_instructions(record)
      notify_by_growl record
      Fake.new
    end

    def unlock_instructions(record)
      notify_by_growl record
      Fake.new
    end
  end
end
