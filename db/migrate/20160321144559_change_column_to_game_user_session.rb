class ChangeColumnToGameUserSession < ActiveRecord::Migration
  def change
    change_column :game_user_sessions, :score, :integer, :default => 0
    change_column :game_user_sessions, :finished, :boolean, :default => false
  end
end
