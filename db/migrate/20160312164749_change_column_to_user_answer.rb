class ChangeColumnToUserAnswer < ActiveRecord::Migration
  def change
    remove_column :user_answers, :answer_id, :references
    add_reference :user_answers, :answer_game, index: true, foreign_key: true
  end
end
