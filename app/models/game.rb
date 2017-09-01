class Game < ActiveRecord::Base
  belongs_to :wine
  belongs_to :game_category
  has_many :game_users, dependent: :destroy
  has_many :users, through: :games_users

end
