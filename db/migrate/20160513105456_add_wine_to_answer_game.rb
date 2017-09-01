class AddWineToAnswerGame < ActiveRecord::Migration
  def change
    add_reference :answer_games, :wine, index: true, foreign_key: true
  end
end
