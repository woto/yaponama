require 'net/http'

class SearchesController < ApplicationController
  def index
    url = URI.parse("http://188.64.170.156:85/prices/search?catalog_number=#{params[:catalog_number]}&manufacturer=#{params[:manufacturer]}&replacements=#{params[:replacements]}&ext_ws=1&format=json&for_shop=1")
    resp = Net::HTTP.get_response(url)
    @parsed_json = ActiveSupport::JSON.decode(resp.body)
    #@parsed_json["result_prices"].shuffle!
    @parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by {|a| (a["job_import_job_delivery_days_declared"].to_f/100) +  a["price_goodness"].to_f }
    new_array = []
    counter = {}
    @parsed_json["result_prices"].each do |item|
      h = item["catalog_number"].to_s + "-" + item["manufacturer"].to_s
      if counter.key? h
        counter[h] = counter[h] + 1
      else
        counter[h] = 0
      end

      if counter[h] < 3
        new_array << item
      end
    end

    @parsed_json["result_prices"] = new_array
    #@parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by {|i| i["manufacturer"].to_s + " - " + i["catalog_number"].to_s}
  end
end
