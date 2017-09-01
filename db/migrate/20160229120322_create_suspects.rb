class CreateSuspects < ActiveRecord::Migration
  def change
    create_table :suspects do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
