class User < ActiveRecord::Base
  has_many :comments
  has_many :votes
  has_many :collections
  has_many :games, through: :collections
  has_many :created_games, class_name: "Game", foreign_key: :creator_id
  has_many :friendships, foreign_key: :friend_1_id
  has_many :friends, through: :friendships, source: :friend

  validates :username, :first_name, :last_name { presence: true}
  has_secure_password
end
