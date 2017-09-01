class RemoveColumnToAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :good_answer
  end
end
