class RemoveColumnFromGameCategory < ActiveRecord::Migration
  def change
    remove_column :game_category, :game_id, :references
  end
end
