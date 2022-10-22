class Users::HotelsController < ApplicationController

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = 'ホテルを登録しました'
      redirect_to hotels_path
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

  def search
    @word = params[:word]
    # @area = params[:area]
    @method = params[:method]
    @results = Hotel.search_for(@word, @method)
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :area)
  end

end
