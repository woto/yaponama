module ApplicationHelper
  def car_identity(request)
    request.car.vin + " " + request.car.frame + " " + request.car.marka + " " + request.car.model + " " + request.car.god
  end
end
