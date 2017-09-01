class AddColumnGoodAnswerToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :good_answer, :boolean
  end
end
