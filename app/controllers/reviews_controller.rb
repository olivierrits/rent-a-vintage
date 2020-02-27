class ReviewsController < ApplicationController
  before_action :set_review, only: :show

  # def index
  #   @review = Review.all
  # end

  def new
    @review = Review.new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    @review = Review.new(review_params)
    @review.car = @car
    @review.user = current_user
    if @review.save
      redirect_to car_path(@car)
    else
      render 'cars/show'
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
