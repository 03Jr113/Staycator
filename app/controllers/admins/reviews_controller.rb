class Admins::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admins_reviews_path, danger: '投稿を削除しました'
  end

end
