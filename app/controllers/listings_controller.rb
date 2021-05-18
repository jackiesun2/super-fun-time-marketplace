class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def create
    @listing = current_user.listing.create(listing_params)
    if @listing.valid?
      redirect_to @listing
    else
      render:new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :location, :images)
  end

end
