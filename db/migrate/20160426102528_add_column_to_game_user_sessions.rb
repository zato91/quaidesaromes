class AddColumnToGameUserSessions < ActiveRecord::Migration
  def change
    add_column :game_user_sessions, :rating, :integer
  end
end
