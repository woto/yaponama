# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
ten = (1000000000 + rand(8999999999)).to_s
10.times do
  user = User.create(:user_name => ten, :phone => ten, :encrypted_password => "$2a$10$Q3cM.pLNZ4bsPV6CtpuZo.JGgXyiCxlClaVavDwdv6NCVSBRwmsDy", :confirmed_at => "2011-12-17 16:01:49.833083")
  10.times do
    ten = (1000000000 + rand(8999999999)).to_s
    car = Car.create(:frame => ten, :vin => '', :model => '', :god => '', :marka => '')
    user.cars << car
    car.save
    10.times do
      ten = (1000000000 + rand(8999999999)).to_s
      request = Request.create(:car => car, :user_id => user.id)
      10.times do
        ten = (1000000000 + rand(8999999999)).to_s
        message = Message.create(:request => request, :message => ten, :user_id => user.id)
        request.messages << message
        message.save
      end
    end
  end
end
