class GameUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_one :wine, through: :game
  has_many :game_suspects, dependent: :destroy
  has_many :suspects, through: :games_suspects
  has_many :question_games, -> { order(position: :asc) }, dependent: :destroy
  has_many :answer_games, through: :question_games
  has_many :game_user_sessions, dependent: :destroy
  has_attachment :photo

  accepts_nested_attributes_for :game_suspects, allow_destroy: true
end
