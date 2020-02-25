class RidesController < ApplicationController
  def index         # GET /rides
    @rides = Ride.all
  end

  def show          # GET /rides/:id
    @rides = Ride.find(params[:id])
  end

  def new           # GET /rides/new
    @rides = Ride.new
  end

  def create        # POST /rides
    @rides = Ride.find(params[:id])
  end

  def edit          # GET /rides/:id/edit
    @rides = Ride.find(params[:id])
  end

  def update        # PATCH /rides/:id
  end

  def destroy       # DELETE /rides/:id
  end

  private
  def ride_params
    params.require(:ride).permit(:user, :car, :start_date, :end_date)
  end
end
