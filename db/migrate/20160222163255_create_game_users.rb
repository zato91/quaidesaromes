class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
