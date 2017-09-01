class CreateQuestionGames < ActiveRecord::Migration
  def change
    create_table :question_games do |t|
      t.references :game, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
