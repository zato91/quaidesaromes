class AddColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :wine_color, :string
  end
end
