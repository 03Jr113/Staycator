class Admins::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.all.page(params[:page]).per(7)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admins_items_path
  end

end
