class RoomsController < ApplicationController
  def index
    @rooms = current_user.all_rooms
  end

  def show
    @room = Room.find(params[:id])
    @pictures = @room.pictures.all
  end

  def new
    @room = Room.new
    @picture = @room.picture.build
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user

    if @room.save
      params[:photos].each do |photo|
        @picture = @room.pictures.create(photo: photo)
      end

      redirect_to new_room_membership_path(@room)

    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :date, photo_attributes: [:id, :room_id, :photo])
  end
end
