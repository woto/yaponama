class InfoController < ApplicationController
  def index
    begin
      file = File.open("#{Rails.root}/system/parts_info/s:#{params['catalog_number']}:#{params['manufacturer']}", "rb")
      @static = file.read
      content_for :title, "Информация по #{params['catalog_number']} - #{params['manufacturer']}"
    rescue Exception => exc
      if exc.instance_of? Errno::ENOENT
        require 'redis'
        redis = Redis.new(:host => APP_CONFIG["redis_address"], :port => APP_CONFIG["redis_port"])
    
        Juggernaut.publish(
        nil, {
          :command => 'info',
          :catalog_number => params["catalog_number"],
          :manufacturer => params["manufacturer"],
        }, {}, "custom")  

        # TODO ! render 503

      end
    end
  end
end
