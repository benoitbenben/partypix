class PicturesController < ApplicationController

  def new
    set_room
    @picture = Picture.new
  end

  def create
    set_room

    # On prend en compte l'upload de plusieurs photos simultanément
    photos = params[:photos]
    photos.each do |photo|
      @picture = Picture.new(room: @room, photo: photo)
      @picture.user = current_user
      @picture.save
    end
    redirect_to room_path(@room)
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def picture_params
    params.require(:picture).permit(:photo)
  end
end
