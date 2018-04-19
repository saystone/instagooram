class User < ApplicationRecord
  has_many :follows, foreign_key: 'following_id', class_name: 'Relationship'
  has_many :follow_users, through: :follows, source: :followed_by
  has_many :followed_by, foreign_key: 'follower_id', class_name: 'Relationship'
  has_many :followed_by_users, through: :followed_by, source: :follow
  has_many :media

  validates :username, presence: true, uniqueness: true
end