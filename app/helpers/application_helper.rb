module ApplicationHelper
  def car_identity(request)
    (request.car.vin + " " + request.car.frame + " " + request.car.marka + " " + request.car.model + " " + request.car.god).strip
  end
  
  def days_decorator value
    html_escape("#{((value = value.to_i) > 0) ? value : '*'}") + "&nbsp;дн.".html_safe
  end 
  
  def count_decorator value
    html_escape("#{((value = (value.to_s.gsub(/\D/, '').to_i)) > 1) ? value : '*'}") + "&nbsp;шт.".html_safe
  end
  
  def cost_decorator value
    html_escape("#{(value).round.to_s}") + "&nbsp;руб.".html_safe
  end  
  
end
