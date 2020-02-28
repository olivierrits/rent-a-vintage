class UsersController < ApplicationController
  def dashboard
    @cars = Car.where(owner: current_user)
    @rides = Ride.where(user: current_user)
    # @start_date = params[:start_date].to_date
  end

  def landing
  end
end
