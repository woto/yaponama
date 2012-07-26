class SearchesController < ApplicationController

  def index

    @parsed_json = { "result_prices" => [] }

    if params[:fast].present? or params[:show].present?
      render :status => 410 and return
    end

    if params[:catalog_number].present?

      # Нужно для того чтобы если например набрали исключительно из символов, которые не попадают в допустимые и образуется пустая строка
      params[:catalog_number] = params[:catalog_number].gsub(/[^a-zA-Z0-9]/, '').upcase
      if params[:catalog_number].blank?
        render :status => 410 and return
      end

      seo_url = search_searches_path(params[:catalog_number].present? ? params[:catalog_number] : nil, params[:manufacturer].present? ? params[:manufacturer] : nil, params[:replacements].to_i > 0 ? '1' : nil)
      if request.fullpath.upcase != seo_url.upcase
        respond_to do |format|
          format.html { redirect_to seo_url, :status => 301 and return }
          format.mobile { redirect_to seo_url + "#jump", :status => 301 and return }
        end
      end

      # Буквально на днях перед написанием этой идеи Яндекс добавил в индекс 17 тыс. страниц
      # @meta_robots = 'index, follow'
      #
      if params[:manufacturer] || params[:replacements]
        @meta_robots = 'noindex, follow'
      else
        @meta_robots = 'index, follow'
      end

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

      request_emex = ''
      if APP_CONFIG["request_emex"]
        request_emex = "&ext_ws=1"
      end

      price_request_cache_key = "#{params[:catalog_number]}-#{params[:manufacturer]}-#{params[:replacements]}"

      if Rails.cache.exist? price_request_cache_key
        @parsed_json = (Rails.cache.read(price_request_cache_key)).dup
      else

        # Если поисковые системы, то согласны взять и закешированную версию
        require 'netaddr'
        cached = ''
        APP_CONFIG['cached_ip'].each do |cidr_string|
          cidr = NetAddr::CIDR.create(cidr_string)
          if cidr.contains? request.remote_ip or cidr == request.remote_ip
            cached = '&cached=1'
            break
          end
        end

        price_request_url = "http://#{APP_CONFIG['price_address']}/prices/search?catalog_number=#{params[:catalog_number]}&manufacturer=#{CGI::escape(params[:manufacturer] || '')}&replacements=#{params[:replacements]}#{request_emex}&format=json&for_site=1#{cached}"

        parsed_price_request_url = URI.parse(price_request_url)

        begin
          require 'net/http'
          resp = Net::HTTP.get_response(parsed_price_request_url)
        rescue Exception => e
          response.headers["Retry-After"] = (Time.now + 1.day).httpdate.to_s
          # @show_sidebar = true
          # TODO Не знаю почему, но для мобильной версии сделать не удалось (... .erb пробовал)
          # render :template => "/shared/503", :status => 503 and return
          render :status => 503 and return
        end

        @parsed_json = ActiveSupport::JSON.decode(resp.body)
        @parsed_json.delete("result_replacements")
        @parsed_json.delete("result_message")
        @parsed_json["result_prices"].map do |item|
          item.delete "retail_cost"
          item.delete "job_import_job_delivery_summary"
          item.delete "supplier_title_full"
          item.delete "job_title"
          item.delete "ij_income_rate"
          item.delete "ps_retail_rate"
          item.delete "supplier_title_en"
          item.delete "income_cost_in_currency_with_weight"
          item.delete "supplier_inn"
          item.delete "logo"
          item.delete "job_import_job_destination_logo"
          item.delete "retail_cost_with_discounts"
          item.delete "job_import_job_kilo_price"
          item.delete "bit_original"
          item.delete "price_cost"
          item.delete "supplier_kpp"
          item.delete "c_weight_value"
          item.delete "ps_absolute_weight_rate"
          item.delete "manufacturer_short"
          item.delete "price_logo_emex"
          item.delete "price_group"
          item.delete "ps_weight_unavailable_rate"
          item.delete "c_buy_value"
          item.delete "currency"
          item.delete "manufacturer_orig"
          item.delete "supplier_title"
          item.delete "ps_relative_weight_rate"
          item.delete "ps_kilo_price"
          item.delete "ps_absolute_buy_rate"
          item.delete "ps_relative_buy_rate"
          item.delete "income_cost_in_currency_without_weight"
          item.delete "catalog_number_orig"
          item.delete "image_url"
          item.delete "retail_cost"
          item.delete "created_at"
          item.delete "job_import_job_delivery_summary"
          item.delete "parts_group"
          item.delete "price_setting_id"
          item.delete "image_url"
          item.delete "supplier_title_full"
          item.delete "job_title"
          item.delete "ij_income_rate"
          item.delete "ps_retail_rate"
          item.delete "min_order"
          item.delete "updated_at"
          item.delete "supplier_title_en"
          item.delete "income_cost_in_currency_with_weight"
          item.delete "external_id"
          item.delete "unit_package"
          item.delete "supplier_inn"
          item.delete "retail_cost_with_discounts"
          item.delete "id"
          item.delete "price_cost"
          item.delete "processed"
          item.delete "job_import_job_kilo_price"
          item.delete "bit_original"
          item.delete "unit"
          item.delete "supplier_kpp"
          item.delete "c_weight_value"
          item.delete "supplier_id"
          item.delete "ps_absolute_weight_rate"
          item.delete "manufacturer_orig"
          item.delete "external_supplier_id"
          item.delete "currency"
          item.delete "c_buy_value"
          item.delete "ps_weight_unavailable_rate"
          item.delete "md5"
          item.delete "job_id"
          item.delete "minimal_income_cost"
          item.delete "income_cost_in_currency_without_weight"
          item.delete "ps_relative_buy_rate"
          item.delete "ps_absolute_buy_rate"
          item.delete "ps_kilo_price"
          item.delete "ps_relative_weight_rate"
          item.delete "catalog_number_orig"
          item.delete "multiply_factor"
          item.delete "job_import_job_presence"
          item.delete "job_import_job_output_order"
          item.delete "real_job_id"
        end


        if params[:replacements]
          expires_in = APP_CONFIG["price_request_cache_with_replacements_in_seconds"]
        else
          expires_in = APP_CONFIG["price_request_cache_without_replacements_in_seconds"]
        end

        #@parsed_json["result_prices"].shuffle!
         
        @parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by { |a|  ( ( (a["job_import_job_delivery_days_average"].present? ? a["job_import_job_delivery_days_average"] : a["job_import_job_delivery_days_declared"]).to_f + a["job_import_job_delivery_days_declared"].to_f)/2/( (fast = params[:fast]).present? ? fast.to_f : 100) ) +  a["price_goodness"].to_f }

        Rails.cache.write(price_request_cache_key, @parsed_json, :expires_in => expires_in)
      end

      #debugger

      new_array = []
      counter = Hash.new{|h, k| h[k] = 0}
      #tree_block = lambda{|h,k| h[k] = Hash.new(&tree_block) }
      tree_block = lambda{|h,k| h[k] = {:titles => Hash.new {|h, k| h[k] = 0} } }
      seo_counter = Hash.new(&tree_block)
      seo_keywords = Hash.new{|h, k| h[k] = 0}

      #require 'redis'
      #redis = Redis.new(:host => APP_CONFIG["redis_address"], :port => APP_CONFIG["redis_port"])

      iconv = Iconv.new('UTF-8//IGNORE//TRANSLIT', 'UTF-8//IGNORE//TRANSLIT') 

      any_found = false

      @parsed_json["result_prices"].each do |item|
        # Криво режется на стороне сервера прайсов, в результате тут не валидная кодировка
        # (если все правильно понимаю, то режется по байту, и как раз второй выпадает)
        # касается названий типа ПЕЧАТНАЯ П%^&*

        item['manufacturer'] = iconv.iconv(item['manufacturer'].to_s + " ")[0..-2]

        next if item["job_import_job_country_short"].include?("avtorif.ru")

        # Необходимо поступать так, т.к. только в момент разбора можем понять есть если ли что-нибудь или нет
        # т.к. необходимо игнорировать точки
        unless any_found
          any_found = true
        end

        h = item["catalog_number"].to_s + " - " + item["manufacturer"].to_s
        if item["catalog_number"].to_s == params[:catalog_number].to_s && item["manufacturer"].present? && (params[:manufacturer].present? ? params[:manufacturer] == item["manufacturer"] : true)
          hh = item["catalog_number"].to_s + " (" + item["manufacturer"].to_s + ")"
          seo_counter[hh][:titles][item["title"]] += 1
          seo_counter[hh][:catalog_number] = item["catalog_number"]
          seo_counter[hh][:manufacturer] = item["manufacturer"]
        end

        item["title"].to_s.split.each do |keyword|
          seo_keywords[keyword] += 1
        end

        counter[h] += 1

        if params[:replacements]
          offers_to_display = 1
        else
          offers_to_display = 5
        end

        if counter[h] <= offers_to_display
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

        # Другая техника получения статуса наличия информации о детали
        #if (data_array = redis.lrange("i:#{item['catalog_number']}:#{item['manufacturer']}", 0, -1)).present?
        #  if data_array.map{|unparsed| JSON.parse(unparsed)}.any? {|json| json['data']}
        #    item['info'] = 'avaliable'
        #  else
        #    item['info'] = 'unavaliable'
        #  end
        #else
        #  item['info'] = 'unknown'
        #end

        item_status = item_status(item['catalog_number'], item['manufacturer'])
        if item_status[:own] == 'avaliable'
          item['info'] = 'avaliable'
        else
          item['info'] = item_status[:their]
        end

      end


      seo_keywords = seo_keywords.sort_by{|k,v| v.to_i}
      seo_keywords = seo_keywords[-seo_keywords.size/2, 1000].to_a.collect{|e| e[0].mb_chars.upcase.gsub(',', ' ').to_s if e[0].mb_chars.size > 2}.uniq.compact.reverse.join(', ')

      seo_counter.each do |catalog_number, arr|
        seo_counter[catalog_number] = { 
          :titles => arr[:titles].sort_by { |k,v| v.to_i  },
          :catalog_number => arr[:catalog_number],
          :manufacturer => arr[:manufacturer]
        }
      end

      seo_counter = seo_counter.sort_by{|k, v| k.mb_chars}

      @parsed_json["result_prices"] = new_array
      @parsed_json["result_prices"] = @parsed_json["result_prices"].sort_by { |i| (i["retail_cost"]).round }

      # Скидка
      if current_user
        @parsed_json["result_prices"].map{|result_price| result_price["retail_cost"] = result_price["retail_cost"] - (result_price["retail_cost"] * current_user["discount"] / 100)}
      end

      # Вверху в цикле прохода по массиву выставляется значение any_found (из-за точек)
      unless any_found
        render :status => 404 and return
      end

      # SEO
      response.last_modified = Time.now.utc
      title = (params[:replacements].present? ? "Аналоги " : "").html_safe
      title << "#{params[:catalog_number]} ".html_safe
      description = ''
      tmp = "".html_safe
      counter = 0

      seo_counter.each do |catalog_number, arr|

        counter += 1

        if arr.size > 0
          if arr[:manufacturer].present?
            title << arr[:manufacturer]
            if counter != seo_counter.size
              title << ", "
            end
          end

          if arr[:titles].last[0].to_s.present?
            description << arr[:titles].last[0].to_s
            if counter != seo_counter.size
              description << ", "
            end
          end

          tmp << "Посмотреть аналоги "
          tmp << view_context.link_to("#{arr[:catalog_number]} (#{arr[:manufacturer]})", search_searches_path(arr[:catalog_number], arr[:manufacturer], 1), :class => 'ajax-search')
          tmp << " #{arr[:titles].last[0].to_s}"
          tmp << "<br />".html_safe 
        end
      end

      @meta_canonical = search_searches_path(params[:catalog_number], params[:manufacturer].present? ? params[:manufacturer] : nil, params[:replacements].to_i > 0 ? '1' : nil)

      @seo_counter_length = seo_counter.length

      @division_blocks = tmp
      @meta_title = title
      @meta_description = description
    else
      @meta_title = "Поиск запчастей по номеру"
    end
    
    @meta_keywords = seo_keywords

    @page = Page.where(:path => search_searches_path(params[:catalog_number], params[:manufacturer], params[:replacements]).gsub(/^\/+/, '')).first
    if @page
      @meta_title = @page.title
      @meta_description = @page.description
      @meta_keywords = @page.keyword
      @meta_robots = @page.robots
    end

    #expires_in 20.minutes

    respond_to do |format|
      format.html { render "index" }
      format.js { render "index" }
      format.mobile
    end

  end
end
