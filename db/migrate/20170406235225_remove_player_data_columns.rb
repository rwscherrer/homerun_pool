class RemovePlayerDataColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :teams, :player_1, :string
  	remove_column :teams, :player_2, :string
  	remove_column :teams, :player_3, :string
  	remove_column :teams, :player_4, :string
  	remove_column :teams, :player_5, :string
  	remove_column :teams, :player_6, :string
  	remove_column :teams, :player_7, :string
  	remove_column :teams, :player_8, :string
  	remove_column :teams, :player_9, :string
  end
end
