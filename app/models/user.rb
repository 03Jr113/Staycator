class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :introduction, length: { maximum: 200 }

  enum age: { ten: 0, twenty: 1, thirty: 2, fourty: 3, fifty: 4, sixty: 5 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum area: { secret: 0, hokkaido: 1, tohoku: 2, kanto: 3, chubu: 4, kinki: 5, chugokushikoku: 6, kyushu: 7, foreign: 8 }

end