class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def create
    @listing = current_user.listing.create(listing_params)
    if @listing.valid?
      redirect_to @listing
    else
      render:new
    end
  end

  def destroy
    @listing.destroy 
    flash[:alert] = "Successfully Deleted Listing"
    redirect_to listings_path
  end

  private 

  def listing_params
    params.require(:listing).permit(:title, :description, :location, :images)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def authorize_user
    @listing = current_user.listing.find_by_id(params[:id])
    return if @listing
    flash[:alert] = "You cannot edit unless you created the listing"
    redirect_to listings_path
  end

end
