class ProfilesController < ApplicationController
  def edit
  end

  def show
    @profile = Profile.find(params[:id])
  end
end
