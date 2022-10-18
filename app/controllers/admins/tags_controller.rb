class Admins::TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admins_tags_path
  end

end
