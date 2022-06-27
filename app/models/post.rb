class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { in: 1..300 }
  validates :user_id, presence: true
end
