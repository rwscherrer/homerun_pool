class AddMlbTeamIdToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :mlb_team_id, :integer
  end
end
