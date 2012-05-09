class InfoController < ApplicationController
  def index
    require 'redis'
    redis = Redis.new(:host => APP_CONFIG["redis_address"], :port => APP_CONFIG["redis_port"])
    @static = redis.get("s:#{params['catalog_number']}:#{params['manufacturer']}")

    #message = new Juggernaut.Message
    #message.type = "event"
    #message.data = {
    #  command: command
    #  catalog_number: catalog_number
    #  manufacturer: manufacturer
    #  channel: $.cookie('channel')
    #}

    #url = URI.parse("http://37.110.44.140/json/info/#{params[:catalog_number]}/#{CGI::escape(params[:manufacturer] || '')}")
    #begin
    #  resp = Net::HTTP.get_response(url)
    #rescue Exception => e
    #  @show_sidebar = true
    #  render :status => 404 and return
    #end
  end
end
