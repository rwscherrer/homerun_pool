class DeletePlayerDataFromTeams < ActiveRecord::Migration[5.0]
  def change
  	remove_column :teams, :player_1, :integer
  	remove_column :teams, :player_2, :integer
  	remove_column :teams, :player_3, :integer
  	remove_column :teams, :player_4, :integer
  	remove_column :teams, :player_5, :integer
  	remove_column :teams, :player_6, :integer
  	remove_column :teams, :player_7, :integer
  	remove_column :teams, :player_8, :integer
  	remove_column :teams, :player_9, :integer
  end
end
