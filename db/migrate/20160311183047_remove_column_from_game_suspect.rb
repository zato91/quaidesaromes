class RemoveColumnFromGameSuspect < ActiveRecord::Migration
  def change
    remove_column :game_suspects, :game_id, :references
  end
end
