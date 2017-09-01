class RemoveGameIdFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :game_id, :references
  end
end
