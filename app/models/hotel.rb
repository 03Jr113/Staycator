class Hotel < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates :hotel_name, presence: true, uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true

  def self.search_for(word, method)
    if method == 'perfect'
      Hotel.where(hotel_name: word)
    elsif method == 'forward'
      Hotel.where('hotel_name LIKE ?', word + '%')
    elsif method == 'backward'
      Hotel.where('hotel_name LIKE ?', '%' + word)
    else
      Hotel.where('hotel_name LIKE ?', '%' + word + '%')
    end
  end

  def avg_score
    unless self.reviews.empty?
      reviews.average(:rate).round(1)
    else
      0.0
    end
  end

  def avg_score_percentage
    unless self.reviews.empty?
      reviews.average(:rate).round(1).to_f*5/5
    else
      0.0
    end
  end

end
