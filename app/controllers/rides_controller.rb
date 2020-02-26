class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :delete]

  def index
    @user = current_user
    @rides = Ride.where(user: current_user)
  end

  def show
    @car = Car.find(@ride.car_id)
    @user = User.find(@ride.user_id)
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.car_id = params[:car_id]
    if @ride.save
      redirect_to user_ride_path(@ride.user.id, @ride)
    else
      render :new
    end
  end

  def update
    if @ride.update(ride_params)
      redirect_to user_rides_path(@ride.user_id)
    else
      render :edit
    end
  end

  def destroy
    @ride.destroy
  end

  private

  def set_ride
     @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:start_date, :end_date, :car, :user)
  end
end
