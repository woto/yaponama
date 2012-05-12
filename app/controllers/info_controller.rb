class InfoController < ApplicationController
  def index
    content_for :meta_robots, '<meta name="robots" content="noindex, nofollow">'.html_safe
    render :status => 404 and return
    #url = URI.parse("http://78.47.225.51:8080/json/info/#{params[:catalog_number]}/#{CGI::escape(params[:manufacturer] || '')}")
    #begin
    #  resp = Net::HTTP.get_response(url)
    #rescue Exception => e
    #  @show_sidebar = true
    #  render :status => 404 and return
    #end
  end
end
