class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true

      t.date :date
      t.integer :type, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end






