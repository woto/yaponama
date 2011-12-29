class Fake
  def deliver
    nil
  end
end

class SmsSender        
      
  def notify(data)
    data[:destinationAddress].insert(0, "+7")
    if Rails.env.production?
      notify_by_sms data
    else 
      notify_by_growl data
    end
  end
  
    
  class << self

    def confirmation_instructions(record)
      self.new.notify(get_data(record))
      Fake.new
    end

    def reset_password_instructions(record)
      self.new.notify(get_data(record))
      Fake.new
    end

    def unlock_instructions(record)
      self.new.notify(get_data(record))
      Fake.new
    end
    
    def get_data record
      {
        :destinationAddress => record.phone,
        :messageData => "Код подтверждения: #{record.confirmation_token || record.reset_password_token}"
      }
    end
    
  end
  
  private
  
    def notify_by_growl data
      g = Growl.new "127.0.0.1", "ruby-growl", ["ruby-growl Notification"]
      #phone = data[:destinationAddress].gsub(/^(\d{3})(\d{3})(\d{2})/, '+7 (\1) \2-\3-')
      g.notify "ruby-growl Notification", data[:destinationAddress] , data[:messageData]
    end
  
    def notify_by_sms data
      require 'net/http'
          
      sms = {
        :sourceAddress => 'Yaponama'
       }
     
      sms.merge!(data)

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
  
    handle_asynchronously :notify_by_sms  
  
end
