class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit, :update]

  def edit
  end

  def show
  end

# Updates the profile and uses profile params as an argument to check if all profile_params checks return true then updates profile and redirects to the listing
# Else renders the edit page again

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  private

# Profile params only permit first_name, last_name, description and an image as inputs 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description, :images)
  end

# Finds the profile using the params to find the id of profile

  def set_profile
    @profile = Profile.find(params[:id])
  end

# Checks the current user has the same id as the user that created the profile
# If it is then it returns the profile else a flash message indicates an authorization error
# Redirects to profile path

  def authorize_user
    @profile = current_user.profile
    return if @profile
    flash[:alert] = "You can only edit your own profile"
    redirect_to profile_path
  end

end
