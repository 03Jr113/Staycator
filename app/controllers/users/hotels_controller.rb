class Users::HotelsController < ApplicationController

  def create
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
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :area)
  end

end
