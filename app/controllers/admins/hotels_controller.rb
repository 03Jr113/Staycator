class Admins::HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:notice] = 'ホテル情報を更新しました'
      redirect_to admins_hotels_path
    else
      render :edit
    end
  end

  def destroy
    hotel = Hotel.find(params[:id])
    hotel.destroy
    redirect_to admins_hotels_path
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :area)
  end

end
