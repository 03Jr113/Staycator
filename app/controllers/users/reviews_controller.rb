class Users::ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.hotel_id = @hotel.id
    tag_list = params[:review][:tags].split(nil)
    if @review.save
      @review.save_tag(tag_list)
      flash[:notice] = 'レビューを投稿しました'
      redirect_to hotel_review_path(@hotel, @review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @review_tag = @review.tags
    @comment = Comment.new
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @review = Review.find(params[:id])
    #tag_list = params[:review][:tags]
    if @review.update(review_params)
      #@review.save_tag(tag_list)
      flash[:notice] = 'レビューを更新しました'
      redirect_to hotel_review_path(@review.hotel, @review)
    else
      render :edit
    end
  end

  def destroy
    hotel = Hotel.find(params[:hotel_id])
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = 'レビューを削除しました'
    redirect_to hotel_path(hotel)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :hotel_id, :date, :traveler, :title, :body, :rate, item_ids: [])
  end

  def correct_user
    @review = Review.find(params[:id])
    unless @review.user == current_user
      flash[:alert] = '投稿者以外は編集できません'
      redirect_to reviews_path
    end
  end

end
