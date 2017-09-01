class AddTeamNameToGameUserSessions < ActiveRecord::Migration
  def change
    add_column :game_user_sessions, :team_name, :string
  end
end
