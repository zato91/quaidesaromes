class AddColumnToGameUser < ActiveRecord::Migration
  def change
    add_column :game_users, :password, :string
    remove_column :game_users, :win, :boolean
  end
end
