class User < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :username, presence: true, uniqueness: true, length: { in: 1..16 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :title, length: { maximum: 32 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
