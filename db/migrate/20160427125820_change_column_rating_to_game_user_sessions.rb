class ChangeColumnRatingToGameUserSessions < ActiveRecord::Migration
  def change
    change_column :game_user_sessions, :rating, :decimal
  end
end
