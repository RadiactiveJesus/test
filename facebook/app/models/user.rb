# frozen_string_literal: true

class User < ApplicationRecord
  default_scope { order(created_at: :desc) }
  scope :all_except, ->(me) { where.not(id: me) }
  before_save :capitalize_names
  has_many :comments, dependent: :destroy
  has_many :posts, foreign_key: 'user_id', class_name: 'Post', dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post'
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  validates :first_name, presence: true
  validates :last_name, presence: true

  def friends
    friends_array = friendships.map{|friendship| friendship.friend if friendship.confirmed}
    friends_array + inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{|friendship| friendship.user == user}
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

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
