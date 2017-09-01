class ChangeReferenceOnUserAnswer < ActiveRecord::Migration
  def change
    remove_column :user_answers, :user_id
    add_reference :user_answers, :game_user, index: true, foreign_key: true
  end
end
