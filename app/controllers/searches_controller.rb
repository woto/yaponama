require 'net/http'

class SearchesController < ApplicationController
  def index
    if params[:fast].present? or params[:show].present?
      raise ActionController::RoutingError.new('Not Found')
    end
    @parsed_json = { "result_prices" => [] }

    if params[:catalog_number].present? and (params[:catalog_number] = params[:catalog_number].gsub(/[^a-zA-Z0-9]/, '').upcase).present?

      if current_user.present?
        condition = { :user_id => current_user.id }
      else
        condition = { :session_id => request.session_options[:id] }
      end

      last_by_detail = SearchHistory.where(condition.merge( :catalog_number => params[:catalog_number], :manufacturer => ((manufacturer = params[:manufacturer]).present?) ? manufacturer : nil ) ).order("created_at DESC").limit(1)
      last_by_user = SearchHistory.where(condition).order("created_at DESC").limit(1)

      if !( last_by_detail.present? && last_by_user.present? ) || ( last_by_detail.first.id  != last_by_user.first.id)
        SearchHistory.create(:user_id => current_user.try(:id), :session_id => request.session_options[:id], :catalog_number => params[:catalog_number], :manufacturer => ((manufacturer = params[:manufacturer]).present? ? manufacturer : nil))
      end

      url = URI.parse("http://188.64.170.156:85/prices/search?catalog_number=#{params[:catalog_number]}&manufacturer=#{CGI::escape(params[:manufacturer] || '')}&replacements=#{params[:replacements]}&ext_ws=1&format=json&for_site=1")
      resp = Net::HTTP.get_response(url)
      @parsed_json = ActiveSupport::JSON.decode(resp.body)
      #@parsed_json["result_prices"].shuffle!
      
      @parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by { |a|  ( ( (a["job_import_job_delivery_days_average"].present? ? a["job_import_job_delivery_days_average"] : a["job_import_job_delivery_days_declared"]).to_f + a["job_import_job_delivery_days_declared"].to_f)/2/( (fast = params[:fast]).present? ? fast.to_f : 100) ) +  a["price_goodness"].to_f }
      new_array = []
      counter = Hash.new{|h, k| h[k] = 0}
      #tree_block = lambda{|h,k| h[k] = Hash.new(&tree_block) }
      tree_block = lambda{|h,k| h[k] = Hash.new {|h, k| h[k] = 0} }
      seo_counter = Hash.new(&tree_block)
      seo_keywords = Hash.new{|h, k| h[k] = 0}
      if @parsed_json["result_prices"].size == 0
        render :status => 404
      end
      @parsed_json["result_prices"].each do |item|
        next if item["job_import_job_country_short"].include?("avtorif.ru")
        h = item["catalog_number"].to_s + " - " + item["manufacturer"].to_s
        if item["catalog_number"].to_s == params[:catalog_number].to_s && item["manufacturer"].present?
          hh = item["catalog_number"].to_s + " (" + item["manufacturer"].to_s + ")"
          seo_counter[hh][item["title"]] += 1
        end

        item["title"].to_s.split.each do |keyword|
          seo_keywords[keyword] += 1
        end

        counter[h] += 1

        if counter[h] <= 3
          if params[:show].present?
            item["css_class"] = "shout"
          end
          new_array << item          
        else
          if params[:show] == '1'
            item["css_class"] = "loud"
            new_array << item            
          end
        end

        item["retail_cost"] = APP_CONFIG["retail_rate"] * item["income_cost"] * case
          when item["supplier_title"] == "emex" 
            APP_CONFIG["emex_income_rate"]
          when item["supplier_title"] == "АВТОРИФ"
            1
          else
            APP_CONFIG["avtorif_income_rate"]
          end
      end

      seo_keywords = seo_keywords.sort_by{|k,v| v.to_i}
      seo_keywords = seo_keywords[-seo_keywords.size/2, 1000].to_a.collect{|e| e[0].mb_chars.upcase.gsub(',', ' ').to_s if e[0].mb_chars.size > 2}.uniq.compact.reverse.join(', ')
      seo_counter.each{|catalog_number, arr| seo_counter[catalog_number] = arr.sort_by { |k,v| v.to_i  }}

      @parsed_json["result_prices"] = new_array
      @parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by { |i| i["retail_cost"].to_i }

      # SEO
      response.last_modified = Time.now.utc
      header = "".html_safe
      header2 = "".html_safe
      counter = 0
      seo_counter.each do |catalog_number, arr|
        counter += 1
        if arr.size > 0
          header << catalog_number + " " + arr.last[0].to_s
          if counter != seo_counter.size
            header << ", "
          end
          header2 << catalog_number + " " + arr.last[0].to_s
          header2 << "<br />".html_safe 
        end
      end

      content_for :title2, header2
      content_for :title, header
      content_for :description, header
    end
    
    #content_for :title, " Поиск запчастей"
    content_for :keywords, seo_keywords
  end
end
