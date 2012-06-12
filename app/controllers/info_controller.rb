class InfoController < ApplicationController
  def index

    @item_status = item_status(params['catalog_number'], params['manufacturer'])

    case @item_status[:their]

      # Если (их) данные имеются 
      when 'avaliable'
        key_part = "#{params['catalog_number']}:#{params['manufacturer']}".mb_chars.gsub(/[^а-яА-Яa-zA-z0-9]/,'_')
        File.open("#{Rails.root}/system/parts_info/s:#{key_part}", "r") do |file|
          @static = file.read
        end
        @meta_title = "Информация по #{params['catalog_number']} - #{params['manufacturer']}"

      # Если (их) неизвестно
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
    end

    # Если (наши) данные имеются
    case @item_status[:own]
      when 'avaliable'
        @page = Page.where(:path => info_path(params["catalog_number"], params["manufacturer"]).gsub(/^\/+/, '')).first
        if @page
          @meta_title = @page.title
          @meta_description = @page.description
          @meta_keywords = @page.keyword
          @meta_robots = @page.robots
        end
    end


    if @item_status.all? {|key, value| value == 'unavaliable'}
      render :status => 410 and return
    end

    if @item_status[:their] == 'unknown' && @item_status[:own] != 'avaliable'
      render :status => 503 and return
    end

  end
end
