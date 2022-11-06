class Users::LabelsController < ApplicationController

  def index
    @labels = Label.all.page(params[:page]).per(7)
  end

  def show
    @label = Label.find(params[:id])
    @reviews = @label.reviews.page(params[:page]).per(7)
  end
end
