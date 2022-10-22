class Users::SearchesController < ApplicationController

  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]
    @method = params[:method]
    if @model == 'hotel'
      @results = Hotel.search_for(@word, @method)
    elsif @model == 'tag'
      @results = Tag.search_for(@word, @method)
    elsif @model == 'item'
      @results = Item.search_for(@word, @method)
    elsif @model == 'review'
      @results = Review.search_for(@word, @method)
    end
  end

end
