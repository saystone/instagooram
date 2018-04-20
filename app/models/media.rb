class Media < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes, source: :user
end