class Post < ApplicationRecord
  belongs_to :user

  has_many :replies, class_name: 'Post', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Post', optional: true

  has_many :reposts, class_name: 'Post', foreign_key: 'source_id'
  belongs_to :source, class_name: 'Post', optional: true

  validates :content, presence: true, length: { in: 1..300 }, unless: :repost?
  validates :user_id, presence: true

  def reply?
    !parent.nil?
  end

  def repost?
    !source.nil?
  end
end
