class InfoController < ApplicationController
  def index

    case @item_status = item_status(params['catalog_number'], params['manufacturer'])

      # Если данные доступны
      when 'avaliable'
        # TODO SECURITY!
        File.open("#{Rails.root}/system/parts_info/s:#{params['catalog_number']}:#{params['manufacturer']}", "r") do |file|
          @static = file.read
        end
        content_for :title, "Информация по #{params['catalog_number']} - #{params['manufacturer']}"

      # Если не доступны
      when 'unavaliable'
        render :status => 410 and return

      # Если неизвестно
      when 'unknown'
       require 'redis'
       redis = Redis.new(:host => APP_CONFIG["redis_address"], :port => APP_CONFIG["redis_port"])
       
       Juggernaut.publish(
       nil, {
         :command => 'info',
         :catalog_number => params["catalog_number"],
         :manufacturer => params["manufacturer"].present? ? params["manufacturer"] : "",
         :channel => 'server'
       }, {}, "custom")  

       render :status => 503 and return
    end
  end
end
