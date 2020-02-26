class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :delete]

  def new
    @ride = Ride.new
  end

  def index
    @user = current_user
    @rides = Ride.where(user: current_user)
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    if @ride.save
      redirect_to ride_path(@ride)
    else
      render :new
    end
  end

  def update
    if @ride.update(ride_params)
      redirect_to ride_path(@ride)
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
    params.require(:ride).permit(:start_date, :end_date, :car_id)
  end
end