class RemoveColumnFromUserAnswer < ActiveRecord::Migration
  def change
    remove_column :user_answers, :question_id, :references
  end
end
