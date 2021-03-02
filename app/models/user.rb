class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy #フォロー取得
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy #フォロワー取得
  has_many :following_users, through: :follower, source: :followed #自分がフォローしている人
  has_many :follower_users, through: :followed, source: :follower #自分をフォローしている人

  has_many :rooms, through: :user_rooms
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy

  attachment :profile_image

  # ユーザーをフォローする
  def follow(user_id)
  	follower.create(followed_id: user_id)
  end
  # ユーザーのフォローを外す
  def unfollow(user_id)
  	follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
  	following_users.include?(user)
  end
end
