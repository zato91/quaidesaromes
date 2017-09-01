class AddColumnToGameSuspects < ActiveRecord::Migration
  def change
    add_reference :game_suspects, :aroma, index: true, foreign_key: true
  end
end
