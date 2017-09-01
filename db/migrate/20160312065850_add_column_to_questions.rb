class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :wine_color, :string
  end
end
