class AddColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :typ, :string
    add_column :questions, :theme, :string
    add_column :questions, :tips, :string
  end
end
