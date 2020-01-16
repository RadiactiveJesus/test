# frozen_string_literal: true

class User < ApplicationRecord
  default_scope { order(created_at: :desc) }
  scope :all_except, ->(me) { where.not(id: me) }
  before_save :capitalize_names
  has_many :comments, dependent: :destroy
  has_many :posts, foreign_key: 'user_id', class_name: 'Post', dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post'
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def capitalize_names
    self.last_name = last_name.capitalize
    self.first_name = first_name.capitalize
  end
end
