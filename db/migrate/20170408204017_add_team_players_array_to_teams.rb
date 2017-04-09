class AddTeamPlayersArrayToTeams < ActiveRecord::Migration[5.0]
  def change
  	add_column :teams, :player_1_data, :string, array:true, default: []
  	add_column :teams, :player_2_data, :string, array:true, default: []
  	add_column :teams, :player_3_data, :string, array:true, default: []
  	add_column :teams, :player_4_data, :string, array:true, default: []
  	add_column :teams, :player_5_data, :string, array:true, default: []
  	add_column :teams, :player_6_data, :string, array:true, default: []
  	add_column :teams, :player_7_data, :string, array:true, default: []
  	add_column :teams, :player_8_data, :string, array:true, default: []
  	add_column :teams, :player_9_data, :string, array:true, default: []
  end
end
