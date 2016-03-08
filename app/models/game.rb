class Game < ActiveRecord::Base
  has_many :taggings
  has_many :categorizations
  has_many :tags, through: :taggings
  has_many :categories, through: :categorizations
  has_many :votes
  has_many :comments
  belongs_to :creator, class_name: 'User'

  validates :name, :description, {presence: true}
  validates :release_year, length: { is: 4 }

  def points #write test
    votes.reduce(0) do |total, vote|
      total += vote.value
    end
  end

  def self.popular_games
    Game.all.sort do |game_a, game_b|
      game_b.points <=> game_a.points
    end
  end
end