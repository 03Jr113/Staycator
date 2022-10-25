class AddReviewIdToHotels < ActiveRecord::Migration[6.1]

  def change
    add_reference :reviews, :hotel, foreign_key: true
  end

end
