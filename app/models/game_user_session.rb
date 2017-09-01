class GameUserSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :game_user

  has_many :user_answers, dependent: :destroy
  has_attachment :photo
end
