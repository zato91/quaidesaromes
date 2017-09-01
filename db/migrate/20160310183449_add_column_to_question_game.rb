class AddColumnToQuestionGame < ActiveRecord::Migration
  def change
    add_column :question_games, :position, :integer
  end
end
