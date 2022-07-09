class User < ApplicationRecord
  has_many :posts, dependent: :nullify

  has_and_belongs_to_many :followers, class_name: 'User', join_table: :follows, foreign_key: :followee_id,
                                      association_foreign_key: :follower_id
  has_and_belongs_to_many :followees, class_name: 'User', join_table: :follows, foreign_key: :follower_id,
                                      association_foreign_key: :followee_id

  has_and_belongs_to_many :liked_posts, class_name: 'Post', join_table: :likes
  has_and_belongs_to_many :disliked_posts, class_name: 'Post', join_table: :dislikes

  validates :username, presence: true, uniqueness: true, length: { in: 1..16 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :title, length: { maximum: 32 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
