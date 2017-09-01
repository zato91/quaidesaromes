class CreateGameUserSessions < ActiveRecord::Migration
  def change
    create_table :game_user_sessions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :game_user, index: true, foreign_key: true
      t.integer :score
      t.boolean :win
      t.boolean :finished
      t.string :session_password
      t.string :session_profile

      t.timestamps null: false
    end
  end
end
