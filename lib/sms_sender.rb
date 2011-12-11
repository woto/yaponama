class Fake
  def deliver
    nil
  end
end

class SmsSender
  class << self
    def confirmation_instructions(record)
      puts '------------------------------------------'
      puts record.phone
      puts record.confirmation_token
      puts record.reset_password_token
      puts '------------------------------------------'
      Fake.new
      #devise_mail(record, :confirmation_instructions)
    end

    def reset_password_instructions(record)
      puts '------------------------------------------'
      puts record.phone
      puts record.confirmation_token
      puts record.reset_password_token
      puts '------------------------------------------'
      Fake.new
      #devise_mail(record, :reset_password_instructions)
    end

    def unlock_instructions(record)
      puts '------------------------------------------'
      puts record.phone
      puts record.confirmation_token
      puts record.reset_password_token
      puts '------------------------------------------'
      Fake.new
      #devise_mail(record, :unlock_instructions)
    end
  end
end
