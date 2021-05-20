class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviewer.new(review_params)
    pp params
    profile = Profile.find(params[:profile_id])
    @review.reviewee = profile.user
    @review.save
    redirect_to profile_path(profile)
  end

  def review_params
    params.require(:review).permit(:title, :description)
  end

end