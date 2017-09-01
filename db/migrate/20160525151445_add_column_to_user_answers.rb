class AddColumnToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :joker_user, :boolean
  end
end
