class ChangeReferenceToQuestionGames < ActiveRecord::Migration
  def change
    remove_column :question_games, :game_id
    add_reference :question_games, :game_user, index: true, foreign_key: true
  end
end
