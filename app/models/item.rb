class Item < ApplicationRecord

  has_many :item_maps, dependent: :destroy, foreign_key: 'item_id'
  has_many :reviews, through: :item_maps

  def self.search_for(word, method)
    if method == 'perfect'
      Item.where(name: word)
    elsif method == 'forward'
      Item.where('name LIKE ?', word + '%')
    elsif method == 'backward'
      Item.where('name LIKE ?', '%' + word)
    else
      Item.where('name LIKE ?', '%' + word + '%')
    end
  end

end
