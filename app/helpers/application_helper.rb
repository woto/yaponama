module ApplicationHelper
  def car_identity(request)
    (request.car.vin + " " + request.car.frame + " " + request.car.marka + " " + request.car.model + " " + request.car.god).strip
  end
  
  def days_decorator value
    html_escape("#{((value = value.to_i) > 0) ? value : '*'}") + "&nbsp;дн.".html_safe
  end 
  
  def count_decorator value
    html_escape("#{((value = (value.to_s.gsub(/\D/, '').to_i)) > 0) ? value : '*'}") + "&nbsp;шт.".html_safe
  end
  
  def cost_decorator value
    html_escape("#{(value).round.to_s}") + "&nbsp;руб.".html_safe
  end

  def phone_decorator value
    value.gsub(/(\d{3})(\d{3})(\d{2})(\d{2})/, '(\1) \2-\3-\4')
  end

  def probability_decorator value
    value.present? ? "#{value.to_i}%" : ""
  end

  def hint_decorator value, add_class=''
    raw "<p><span class=\"label #{add_class}\">К сведению</span> #{value}</p>"
  end

  def brands_decorator brand
    link_to Brands::BRANDS[brand][:title].html_safe, "/brands/#{Brands::BRANDS[brand][:file]}", :class => "brands-#{Brands::BRANDS[brand][:file]}"
  end

end
