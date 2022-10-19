class Users::HomesController < ApplicationController

  def top
    @reviews = Review.order('id DESC').limit(3)
    @items = Item.all
  end

  def about
  end

  def rank
    @item_ranks = Item.find(Review.group(:item_id).order('count(item_id) desc').pluck(:item_id))
  end

end
