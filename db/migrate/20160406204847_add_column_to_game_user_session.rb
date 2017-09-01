class AddColumnToGameUserSession < ActiveRecord::Migration
  def change
    add_column :game_user_sessions, :provisional_score, :integer, :default => 0
    add_column :game_user_sessions, :final_score, :integer, :default => 0
  end
end
