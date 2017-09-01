class CreateAromas < ActiveRecord::Migration
  def change
    create_table :aromas do |t|
      t.string :name
      t.string :family
      t.string :sub_family

      t.timestamps null: false
    end
  end
end
