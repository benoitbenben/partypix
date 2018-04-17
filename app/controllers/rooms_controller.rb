class RoomsController < ApplicationController
  def index
    @rooms = current_user.all_rooms

    @ordered_rooms = @rooms.sort{|a,b| b.date <=> a.date}

    @yearly_grouped_rooms = @ordered_rooms.group_by{|room| room.date.year }

  end

  def show
    @room = Room.find(params[:id])

    @pictures = @room.pictures

    top10_pictures
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user

    if @room.save
      redirect_to new_room_membership_path(@room)

    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)

    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :date)
  end

  def top10_pictures
    @top10_pictures = @pictures.top_10.select { |picture| picture.upvotes_count > 0 }
  end

end
