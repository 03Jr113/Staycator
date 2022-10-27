class CreateItemMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :item_maps do |t|
      t.references :review, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
