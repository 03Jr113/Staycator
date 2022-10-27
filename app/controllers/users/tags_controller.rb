class Users::TagsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tags = Tag.all.page(params[:page]).per(7)
  end

  def show
    @tag = Tag.find(params[:id])
    @reviews = @tag.reviews.page(params[:page]).per(7)
  end

end
