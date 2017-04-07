class AddPlayerDataToTeams < ActiveRecord::Migration[5.0]
  def change
  	add_column :teams, :player_1, :integer
  	add_column :teams, :player_2, :integer
  	add_column :teams, :player_3, :integer
  	add_column :teams, :player_4, :integer
  	add_column :teams, :player_5, :integer
  	add_column :teams, :player_6, :integer
  	add_column :teams, :player_7, :integer
  	add_column :teams, :player_8, :integer
  	add_column :teams, :player_9, :integer
  end
end
