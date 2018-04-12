class UpvotesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])

    if @picture.upvotes.find_by(user: current_user).nil?
      @upvote = Upvote.create(user: current_user, picture: @picture)
    else
      redirect_to picture_path(@picture)
    end

    # à remplacer plus tard par de l'ajax si le temps
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    @upvote = @picture.upvotes.find_by(user: current_user)

    if @upvote
      @upvote.destroy
    else
      redirect_to picture_path(@picture)
    end

    # à remplacer plus tard par de l'ajax si le temps
    redirect_to picture_path(@picture)
  end
end
