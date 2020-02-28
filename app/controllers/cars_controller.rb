class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @ride = Ride.new()
    @rides = Ride.where(car: @car)
    @rating = rand(1..5)
    # start_date1 = Time.new(2020,3,3).to_date
    # end_date1 = Time.new(2020,3,5).to_date
    # start_date2 = Time.new(2020,3,10).to_date
    # end_date2 = Time.new(2020,3,15).to_date
    # @ride1 = Ride.new(start_date: start_date1, end_date: end_date1, distance: 0, car: @car, user: User.last);
    # @ride2 = Ride.new(start_date: start_date2, end_date: end_date2, distance: 0, car: @car, user: User.last);
    # @rides = [ @ride1, @ride2 ]
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
    if @car.user == current_user
      alert("Are you sure you want to remove this car?")
      @car.destroy
    else
      alert("You are not authenticated for this action")
    end
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :brand, :model, :year, :description, :price, :address)
  end
end
