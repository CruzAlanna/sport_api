class RemoveHomeAndAwayTeamIdsFromTeams < ActiveRecord::Migration[8.0]
  def change
    remove_column :teams, :home_team_id, :integer
    remove_column :teams, :away_team_id, :integer
  end
end
