class RemoveTeamPlayersFromTeams < ActiveRecord::Migration[5.0]
  def change
  	remove_column :teams, :team_players, :integer
  end
end
