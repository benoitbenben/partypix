class ProfilesController < ApplicationController
 before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @user = current_user
  end

  # def create
  #   @profile = User.find(profile_params)
  #   # @user = User.find(params(new_user_registration))
  #   if profile.save
  #     redirect_to "My Profile", profile_path
  #   else
  #     render :new
  # end

  def edit

  end

  def update

  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :first_name, :last_name, :email, :avatar)
  end
end
