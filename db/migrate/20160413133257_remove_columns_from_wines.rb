class RemoveColumnsFromWines < ActiveRecord::Migration
  def change
    remove_column :wines, :tasting_date
    remove_column :wines, :taster
    remove_column :wines, :bitterness
    remove_column :wines, :fruitiness
  end
end
