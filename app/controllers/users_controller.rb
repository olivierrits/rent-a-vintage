class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @cars = Car.where(user: @user)
    @rides = Ride.where(user: @user)
    # @start_date = params[:start_date].to_date
  end

  def landing
  end

end
