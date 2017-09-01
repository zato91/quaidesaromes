class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :question_games, dependent: :destroy

  def next
    Question.find(self.id + 1)
  end
end
