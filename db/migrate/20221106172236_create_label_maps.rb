class CreateLabelMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :label_maps do |t|
      t.references :review, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
