class RoomsController < ApplicationController
  def index
    @rooms = current_user.all_rooms
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user

    if @room.save
      #TODO : penser à changer cette route quand la feature Inviter Contributeurs sera faite.
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :date)
  end
end