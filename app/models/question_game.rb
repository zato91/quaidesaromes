class QuestionGame < ActiveRecord::Base
  belongs_to :game_user
  belongs_to :question
  belongs_to :wine
  has_many :user_answers, dependent: :destroy
  has_many :answer_games, dependent: :destroy

  acts_as_list scope: :game_user

  def next
    QuestionGame.find(self.id + 1)
  end
end
