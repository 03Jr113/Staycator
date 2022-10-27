class AddColumnsToHotels < ActiveRecord::Migration[6.1]

  def change
    add_column :hotels, :area, :integer, null: false
  end

end
