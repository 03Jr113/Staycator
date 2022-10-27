class Admins::TagsController < ApplicationController

  def index
    @tags = Tag.all.page(params[:page]).per(7)
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admins_tags_path
  end

end
