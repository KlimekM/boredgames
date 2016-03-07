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

end
