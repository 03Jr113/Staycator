class Users::HomesController < ApplicationController

  def top
    @reviews = Review.order('id DESC').limit(3)
  end

  def about
  end

end
