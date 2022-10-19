class Users::CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
