class PicturesController < ApplicationController
  before_action :set_room, only: [:new, :create]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    @picture.room = @room
    @picture.user = current_user

    if @picture.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def picture_params
    params.require(:picture).permit(:photo)
  end
end
