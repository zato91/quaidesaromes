class ChangeColumnToGames < ActiveRecord::Migration
  def change
    remove_column :games, :category, :string
    add_reference :games, :game_category, index: true, foreign_key: true
  end
end
