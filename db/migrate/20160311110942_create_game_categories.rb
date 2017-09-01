class CreateGameCategories < ActiveRecord::Migration
  def change
    create_table :game_categories do |t|
      t.references :game, index: true, foreign_key: true
      t.string :category

      t.timestamps null: false
    end
  end
end
