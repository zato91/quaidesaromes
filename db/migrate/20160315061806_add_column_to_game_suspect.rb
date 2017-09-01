class AddColumnToGameSuspect < ActiveRecord::Migration
  def change
    add_column :game_suspects, :position, :integer
  end
end
