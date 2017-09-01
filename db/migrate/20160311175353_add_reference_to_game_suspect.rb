class AddReferenceToGameSuspect < ActiveRecord::Migration
  def change
    add_reference :game_suspects, :game_user, index: true, foreign_key: true
  end
end
