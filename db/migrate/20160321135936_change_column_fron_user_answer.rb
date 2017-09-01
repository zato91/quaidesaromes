class ChangeColumnFronUserAnswer < ActiveRecord::Migration
  def change
    remove_column :user_answers, :game_user_id, :references
    add_reference :user_answers, :game_user_session, index: true, foreign_key: true
  end
end
