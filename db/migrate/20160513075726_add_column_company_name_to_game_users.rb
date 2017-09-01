class AddColumnCompanyNameToGameUsers < ActiveRecord::Migration
  def change
    add_column :game_users, :company_name, :string
  end
end
