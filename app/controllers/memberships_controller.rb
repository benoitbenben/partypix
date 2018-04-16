class MembershipsController < ApplicationController
  def index
    @contributor = User.where(id:params[:contributors])
  end

  def new
    @room = Room.find(params[:room_id])
    @users = User.order(email: :asc).all
  end

  def create

    # Choper tous les ids soumis par le form de select2
    # Choper la room à partir du room_id
    # Pour chaque id des users, on veut:
    #   Récuperer le user
    #   Créer un membership entre ce user et room

    # redirect_to room_path(room)
    @room = Room.find(params[:room_id])

    @contributors_ids = params[:contributors_ids]

    @contributors_ids.each do |contributor_id|
      contributor = User.find(contributor_id)
      Membership.create(user: contributor, room: @room)
    end

    redirect_to room_path(@room)


    # @contributors = []

    # @contributors.each do |contributor|
    #   contributor = Membership.new(params[:contributor])
    #   @contributor = contributor
    #   @room = Room.find(params[:room_id])
    #   contributor.room = @room
    # end

  end

  private

  def contributor_params
    # params.require(:membership).permit(:status)
  end
end
