# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'staycator@hotel.com',
   password: 'staycator202210'
)

Item.create!([
  { name: 'DVD・Blu-rayプレイヤー' },
  { name: 'HDMI端子・貸出ケーブル' },
  { name: 'TVミラーリング' },
  { name: 'プロジェクター' },
  { name: '館内に売店・レストラン' },
  { name: '大浴場・サウナ・岩盤浴' }
])