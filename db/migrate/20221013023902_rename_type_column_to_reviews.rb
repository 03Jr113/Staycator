class RenameTypeColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :type, :traveler
  end
end
