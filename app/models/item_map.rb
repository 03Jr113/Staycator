class ItemMap < ApplicationRecord

  belongs_to :review
  belongs_to :item

  # validate :review_id, presence: true
  # validate :item_id, presence: true

end
