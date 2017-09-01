class GameCategory < ActiveRecord::Base
  has_many :games

  validates :category, uniqueness: true, presence: true
end
