class AnswerGame < ActiveRecord::Base
  belongs_to :question_game
  belongs_to :answer
  has_many :user_answers, dependent: :destroy
end
