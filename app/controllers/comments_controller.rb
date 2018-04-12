class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new(comment_params)

    @comment.picture = @picture
    @comment.user = current_user
    @comment.date = Date.today

    if @comment.save
      redirect_to picture_path(@picture)
    else
      render "pictures/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
