class Users::HomesController < ApplicationController

  def top
    @reviews = Review.order('id DESC').limit(3)
    @items = Item.all
  end

  def about
  end

end
