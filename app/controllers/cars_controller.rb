class CarsController < ApplicationController
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cars }
    end
  end

  # GET /cars/new
  # GET /cars/new.json
  def new
    @car = Car.new
    3.times { @car.car_assets.build }    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
    3.times { @car.car_assets.build }    
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        format.html { redirect_to new_car_request_path(@car), :notice => 'Вы успешно добавили новый автомобиль.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.json
  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to cars_path, :notice => 'Вы успешно обновили свойства автомобиля.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :ok }
    end
  end
end
