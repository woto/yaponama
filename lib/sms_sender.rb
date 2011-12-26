class Fake
  def deliver
    nil
  end
end

class SmsSender  
    
  def notify_by_growl record
    g = Growl.new "127.0.0.1", "ruby-growl", ["ruby-growl Notification"]
    phone = record.phone.gsub(/^(\d{3})(\d{3})(\d{2})/, '+7 (\1) \2-\3-')
    g.notify "ruby-growl Notification", "Номер #{phone}" , "Код подтверждения: #{record.confirmation_token || record.reset_password_token}"
  end
  
  def notify_by_sms record
    require 'net/http'
      
    sms = {
      :destinationAddress => "+7#{record.phone}",
      :messageData => "Код подтверждения: #{record.confirmation_token || record.reset_password_token}",
      :sourceAddress => 'Yaponama'
     }

      Net::HTTP.start('sms.avisosms.ru') do |http| 
        req = Net::HTTP::Post.new('/gate.php')
        req.set_content_type('text/xml', { 'charset' => 'utf-8' })
        req.body = ApplicationController.new.send(:render_to_string,
                                        :partial => 'avisosms/send_sms_text.html', 
                                        :layout => false,
                                        :locals => { :sms => sms })
        req.add_field("SOAPAction", '"http://sms.avisosms.ru/gate.php"') 
        response = http.request(req)
        
        if( (status = Hash.from_xml(response.body)["Envelope"]["Body"]["SendTextMessageResponse"]["SendTextMessageResult"]) != 'OK_Operation_Completed')
          raise status
        end
        
      end
  end      
      
  def send_sms(record)
    #notify_by_growl record
    notify_by_sms record
  end
  
  handle_asynchronously :send_sms
  
    
  class << self

    def confirmation_instructions(record)
      self.new.send_sms(record)
      Fake.new
    end

    def reset_password_instructions(record)
      self.new.send_sms(record)
      Fake.new
    end

    def unlock_instructions(record)
      self.new.send_sms(record)
      Fake.new
    end
  end
end
