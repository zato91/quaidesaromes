class AddFinishAndWinToGameUser < ActiveRecord::Migration
  def change
    add_column :game_users, :finished, :boolean, default: false
    add_column :game_users, :win, :boolean
  end
end
