class User < ApplicationRecord
  has_many :relationships
  has_many :media

  validates :username, presence: true, uniqueness: true
end