require 'net/http'

class SearchesController < ApplicationController
  def index
    @parsed_json = { "result_prices" => [] }

    if params[:catalog_number]
      params[:catalog_number] = params[:catalog_number].gsub(/[^a-zA-Z0-9]/, '')

      if current_user.present?
        condition = { :user_id => current_user }
      else
        condition = { :session_id => request.session_options[:id] }
      end

      last_by_detail = SearchHistory.where(condition.merge( :catalog_number => params[:catalog_number], :manufacturer => params[:manufacturer]) ).order("created_at DESC").limit(1)
      last_by_user = SearchHistory.where(condition).order("created_at DESC").limit(1)

      if !( last_by_detail.present? && last_by_user.present? ) || ( last_by_detail.first.id  != last_by_user.first.id)
        SearchHistory.create(:user_id => current_user, :session_id => request.session_options[:id], :catalog_number => params[:catalog_number], :manufacturer => params[:manufacturer])
      end

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
      @parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by { |i| i["income_cost"].to_i }
    end
  end
end