class CarsController < ApplicationController
  def index
    @car = Car.find
  end

  def show
    @car = Car.find(params[:id])
    @ride = Ride.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    #assign a user to the car
    @car.user = current_user
    @car.save
    redirect_to @car
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)

  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to car_path

  end

  private

  def car_params
    params.require(:car).permit(:name, :brand, :model, :year, :description, :price)
  end
end
