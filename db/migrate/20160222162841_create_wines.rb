class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :estate
      t.string :cuvee
      t.string :label
      t.string :region
      t.string :country
      t.string :vintage
      t.string :grape_varieties
      t.string :color
      t.integer :volume
      t.date :tasting_date
      t.string :taster
      t.string :tasting_color
      t.string :aromas_family
      t.integer :sweetness
      t.integer :acidity
      t.integer :tannins
      t.integer :alcohol
      t.integer :body
      t.integer :bitterness
      t.integer :fruitiness
      t.integer :length

      t.timestamps null: false
    end
  end
end
