class MembershipsController < ApplicationController
  def index
    @contributor = User.where(id:params[:contributors])
  end

  def new
    @users = User.order(email: :asc).all
  end

  def create
    @contributor = Membership.new(params[:contributor])
    @room = Room.find(params[:room_id])

    @contributor.room = @room
    @contributor.user = current_user

    if @contributor.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def contributor_params
    # params.require(:membership).permit(:status)
  end
end
