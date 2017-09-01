class ChangeColumnRating < ActiveRecord::Migration
  def change
    change_column :game_user_sessions, :rating, :float
  end
end
