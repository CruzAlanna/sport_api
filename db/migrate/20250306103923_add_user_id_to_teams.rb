class AddUserIdToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :user_id, :integer
  end
end
