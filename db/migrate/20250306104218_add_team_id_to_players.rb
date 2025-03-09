class AddTeamIdToPlayers < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :team_id, :integer
  end
end
