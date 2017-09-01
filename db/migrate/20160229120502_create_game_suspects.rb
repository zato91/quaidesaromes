class CreateGameSuspects < ActiveRecord::Migration
  def change
    create_table :game_suspects do |t|
      t.references :suspect, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.references :wine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
