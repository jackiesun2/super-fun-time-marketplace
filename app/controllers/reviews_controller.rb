class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

# Intializes a review instance variable and starts a new review   

  def new
    @review = Review.new
  end

# Creates new review, using the current user and passing through same review_params as an argument, saves review to instance variable
# Finds the profile of the user that is being reviewed, saves reviewee as the profile being reviewed and redirects to profile of the reviewee
# The reviewer is stored as the current user

  def create
    @review = current_user.reviewer.new(review_params)
    profile = Profile.find(params[:profile_id])
    @review.reviewee = profile.user
    @review.save
    redirect_to profile_path(profile)
  end

# Review params only permit title, description as inputs 

  def review_params
    params.require(:review).permit(:title, :description)
  end

end