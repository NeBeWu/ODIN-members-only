class Post < ApplicationRecord
  belongs_to :user

  has_many :replies, class_name: 'Post', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Post', optional: true

  validates :content, presence: true, length: { in: 1..300 }
  validates :user_id, presence: true
end
