class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @cars = Car.where(user: @user)
  end
end
