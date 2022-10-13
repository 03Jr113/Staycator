class Review < ApplicationRecord

  belongs_to :user

  enum traveler: { couple: 0, friend: 1, family: 2, single: 3, business: 4, other: 5 }

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 400 }

end
