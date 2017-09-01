class UserAnswer < ActiveRecord::Base
  belongs_to :game_user_session
  belongs_to :question_game
  belongs_to :answer_game
end
