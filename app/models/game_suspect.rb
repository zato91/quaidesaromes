class GameSuspect < ActiveRecord::Base
  belongs_to :suspect
  belongs_to :wine
  belongs_to :game_user

  validates :game_user, presence: true
end
