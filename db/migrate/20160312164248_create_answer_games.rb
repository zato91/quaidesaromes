class CreateAnswerGames < ActiveRecord::Migration
  def change
    create_table :answer_games do |t|
      t.references :question_game, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.boolean :good_answer

      t.timestamps null: false
    end
  end
end
