class AddPlayerColumnsBackToTeams < ActiveRecord::Migration[5.0]
  def change
  	add_column :teams, :player_1, :string
  	add_column :teams, :player_2, :string
  	add_column :teams, :player_3, :string
  	add_column :teams, :player_4, :string
  	add_column :teams, :player_5, :string
  	add_column :teams, :player_6, :string
  	add_column :teams, :player_7, :string
  	add_column :teams, :player_8, :string
  	add_column :teams, :player_9, :string
  end
end
