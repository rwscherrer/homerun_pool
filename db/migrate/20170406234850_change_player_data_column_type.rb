class ChangePlayerDataColumnType < ActiveRecord::Migration[5.0]
  def change
  	change_column :teams, :player_1, :string
  	change_column :teams, :player_2, :string
  	change_column :teams, :player_3, :string
  	change_column :teams, :player_4, :string
  	change_column :teams, :player_5, :string
  	change_column :teams, :player_6, :string
  	change_column :teams, :player_7, :string
  	change_column :teams, :player_8, :string
  	change_column :teams, :player_9, :string
  end
end
