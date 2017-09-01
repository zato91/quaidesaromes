class AddColumnToUserAnswer < ActiveRecord::Migration
  def change
    add_reference :user_answers, :question_game, index: true, foreign_key: true
  end
end
