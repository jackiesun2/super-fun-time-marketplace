class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit, :update]
  

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description, :images)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def authorize_user
    @profile = current_user.profile
    return if @profile
    flash[:alert] = "You can only edit your own profile"
    redirect_to profile_path
  end

end
