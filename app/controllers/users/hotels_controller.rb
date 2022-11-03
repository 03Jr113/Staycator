class Users::HotelsController < ApplicationController

  before_action :authenticate_user!

  def create
    @hotels = Hotel.all.page(params[:page]).per(7)
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = 'ホテルを登録しました'
      redirect_to hotel_path(@hotel)
    else
      render :index
    end
  end

  def index
    @hotel = Hotel.new
    @hotels = Hotel.all.page(params[:page]).per(7)
  end

  def show
    @hotel = Hotel.find(params[:id])
    @reviews = @hotel.reviews.page(params[:page]).per(7)
  end

  def map_edit
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :lat, :lng)
  end

end
