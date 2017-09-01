class AddColumnAlcoholPercentToWine < ActiveRecord::Migration
  def change
    add_column :wines, :alcohol_percentage, :float
  end
end
