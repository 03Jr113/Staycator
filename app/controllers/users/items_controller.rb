class Users::ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @items = Item.all.page(params[:page]).per(7)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.page(params[:page]).per(7)
  end

end