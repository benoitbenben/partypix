class ProfilesController < ApplicationController
 before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @user = current_user
  end

  def edit
    @profile = current_user

  end

  def update
    @profile = current_user

    if @profile.update(user_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :email, :avatar)
  end

end
