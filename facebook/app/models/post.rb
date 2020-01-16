# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope { order(created_at: :desc) }
  validates :content, presence: true

  def liked?(user)
    likes.find_by(user_id: user.id)
  end
end
