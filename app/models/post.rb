class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 1..300 }
  validates :body, presence: true
end
