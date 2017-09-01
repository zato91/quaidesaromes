class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answer_games, dependent: :destroy
end
