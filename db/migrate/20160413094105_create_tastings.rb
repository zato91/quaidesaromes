class CreateTastings < ActiveRecord::Migration
  def change
    create_table :tastings do |t|
      t.references :wine, index: true, foreign_key: true
      t.string :taster_name
      t.date :tasting_date
      t.string :color
      t.integer :sweetness
      t.integer :acidity
      t.integer :tannins
      t.integer :alcohol
      t.integer :body
      t.integer :length

      t.timestamps null: false
    end
  end
end
