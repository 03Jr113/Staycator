class Item < ApplicationRecord

  has_many :item_maps, dependent: :destroy, foreign_key: 'item_id'
  has_many :reviews, through: :item_maps

end
