class AddLatToHotel < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :lat, :float
    add_column :hotels, :lng, :float
    
    remove_column :hotels, :area, :integer 
  end
end
