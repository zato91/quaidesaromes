class AddColumnToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :title, :string
  end
end
