class User < ApplicationRecord
  has_many :followings, foreign_key: "following_id", class_name: "Relationship"
  has_many :followers, foreign_key: "follower_id", class_name: "Relationship"
  has_many :media

  validates :username, presence: true, uniqueness: true
end