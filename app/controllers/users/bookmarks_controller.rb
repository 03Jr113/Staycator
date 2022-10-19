class Users::BookmarksController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @bookmark = @review.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      flash[:notice] = 'ブックマークしました'
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @bookmark = @review.bookmarks.find_by(user_id: current_user.id)
    if @bookmark.present?
      @bookmark.destroy
      flash[:notice] = 'ブックマークを外しました'
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

end
