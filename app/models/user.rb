class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followed_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  validates :introduction, length: { maximum: 200 }

  enum age: { ten: 0, twenty: 1, thirty: 2, fourty: 3, fifty: 4, sixty: 5 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum area: { secret: 0, hokkaido: 1, tohoku: 2, kanto: 3, chubu: 4, kinki: 5, chugokushikoku: 6, kyushu: 7, foreign: 8 }

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followed_user.include?(user)
  end

end