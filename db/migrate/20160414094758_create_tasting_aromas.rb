class CreateTastingAromas < ActiveRecord::Migration
  def change
    create_table :tasting_aromas do |t|
      t.references :aroma, index: true, foreign_key: true
      t.references :tasting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
