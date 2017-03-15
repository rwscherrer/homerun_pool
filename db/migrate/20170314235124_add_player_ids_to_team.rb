class AddPlayerIdsToTeam < ActiveRecord::Migration[5.0]
  def change
  	add_column :teams, :team_players, :integer, array:true, default: []
  end
end
