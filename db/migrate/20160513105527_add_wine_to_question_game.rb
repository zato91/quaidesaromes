class AddWineToQuestionGame < ActiveRecord::Migration
  def change
    add_reference :question_games, :wine, index: true, foreign_key: true
  end
end
