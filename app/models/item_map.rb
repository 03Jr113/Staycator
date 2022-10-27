class ItemMap < ApplicationRecord

  belongs_to :review
  belongs_to :item

  # validates :review_id, presence: true
  # validates :item_id, presence: true

end
