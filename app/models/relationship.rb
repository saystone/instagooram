class Relationship < ApplicationRecord
  belongs_to :follow, foreign_key: 'following_id', class_name: 'User'
  belongs_to :followed_by, foreign_key: 'follower_id', class_name: 'User'
end