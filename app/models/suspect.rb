class Suspect < ActiveRecord::Base
  has_many :games_suspects
  has_many :games, through: :games_suspects
  has_many :wines, through: :games_suspects
  has_attachment :photo_freaky
  has_attachment :photo_happy
  has_attachment :photo_sad

end
