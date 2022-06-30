class Post < ApplicationRecord
  belongs_to :user

  has_many :replies, class_name: 'Post', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Post', optional: true

  has_many :reposts, class_name: 'Post', foreign_key: 'repost_id'
  belongs_to :source, class_name: 'Post', optional: true

  validates :content, presence: true, length: { in: 1..300 }, unless: :a_repost?
  validates :user_id, presence: true

  def a_repost?
    !source.nil?
  end
end
