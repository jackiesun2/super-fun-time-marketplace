class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

# Queries listing model to find all listings and stores all listings in an instance variable
# Eager loads all the images on the listing page at once rather one at a time through a iterator loop

  def index
    @listings = Listing.all.with_attached_images
  end

# Intializes a listing instance variable and starts a new listing   

  def new
    @listing = Listing.new
  end

  def show
  end

  def edit
  end

# Updates the listing and uses listing params as an argument to check if all listing_params checks return true then updates listing and redirects to the listing
# Else renders the edit page again

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

# Creates new listing, using the current user and passing through same listing_params as an argument, saves listing to instance variable
# Checks if the listing passes listing_params and is valid, redirect to the listing else render the new listing page again

  def create
    @listing = current_user.listing.create(listing_params)
    if @listing.valid?
      redirect_to @listing
    else
      render:new
    end
  end

# Destroys the listing, and flashes a successful deletion message and redirectrs to main listings path with all listings 

  def destroy
    @listing.destroy 
    flash[:alert] = "Successfully Deleted Listing"
    redirect_to listings_path
  end

  private 

# Listing params only permit title, description, location and images as inputs 

  def listing_params
    params.require(:listing).permit(:title, :description, :location, :images)
  end

# Finds the listing using the params to find the id of listing

  def set_listing
    @listing = Listing.find(params[:id])
  end

# Checks the current user has the same id as the user that created the listing
# If it is then it returns the listing else a flash message indicates an authorization error
# redirects to listings path

  def authorize_user
    @listing = current_user.listing.find_by_id(params[:id])
    return if @listing
    flash[:alert] = "You cannot edit unless you created the listing"
    redirect_to listings_path
  end

end
