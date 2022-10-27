class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reviews, through: :tag_maps

  def self.search_for(word, method)
    if method == 'perfect'
      Tag.where(name: word)
    elsif method == 'forward'
      Tag.where('name LIKE ?', word + '%')
    elsif method == 'backward'
      Tag.where('name LIKE ?', '%' + word)
    else
      Tag.where('name LIKE ?', '%' + word + '%')
    end
  end

end
