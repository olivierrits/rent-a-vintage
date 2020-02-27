class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :delete]

  def new
    @ride = Ride.new
    @car = Car.find(params[:car_id])
    @start_date = params[:start_date].to_date
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
    if user_signed_in?
      @ride.user = current_user
      @car = @ride.car
      if @ride.save
        redirect_to user_dashboard_path
      else
        render :new
      end
    else
      render :sign_up, local: { ride: @ride }
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
