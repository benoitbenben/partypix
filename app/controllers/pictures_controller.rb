class PicturesController < ApplicationController
  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new

    @upvote = Upvote.new

    @upvotes = @picture.upvotes.all
    @room    = @picture.room
  end

  def new
    set_room
    @picture = Picture.new
  end

  # create pour drag n' drop
  def create
    @room = Room.find(params[:room_id])

    respond_to do |format|
      format.html do
        photos = params[:photos]
        photos.each do |photo|
          picture = Picture.new(room: @room, photo: photo)
          picture.user = current_user
          picture.save
        end

        redirect_to room_path(@room)
      end

      format.json do
        @picture = Picture.create!(room: @room, user: current_user, photo: params[:photo])
        render json: { picture_id: @picture.id }
      end
    end
  end

  def destroy
    # For PartyPix => to not allow any user to destroy any pictures by crafting a url
    # picture = current_user.pictures.find(params[:id])

    Picture.destroy(params[:id])
    render json: {}
  end

  # menu next et prev pictures show
  def next
    @room    = Room.find(params[:room_id])
    @picture = @room.pictures.where("id > ?", params[:id]).limit(1).first || @room.pictures.order(:id).first
    redirect_to picture_path(@picture)
  end

  def prev
    @room = Room.find(params[:room_id])
    @picture = @room.pictures.where("id < ?", params[:id]).limit(1).first || @room.pictures.order(:id).last
    redirect_to picture_path(@picture)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def picture_params
    params.require(:picture).permit(:photo)
  end
end
