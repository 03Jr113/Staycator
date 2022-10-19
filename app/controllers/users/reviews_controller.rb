class Users::ReviewsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    tag_list = params[:review][:tags].split(nil)
    if @review.save
      @review.save_tag(tag_list)
      flash[:notice] = 'レビューを投稿しました'
      redirect_to review_path(@review.id)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
    @tag_list = Tag.all
  end

  def show
    @review = Review.find(params[:id])
    @review_tag = @review.tags
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'レビューを更新しました'
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = 'レビューを削除しました'
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :date, :traveler, :title, :body)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to reviews_path unless @user == current_user
  end

end
