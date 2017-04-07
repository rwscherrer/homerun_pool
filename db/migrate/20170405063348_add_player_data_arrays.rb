class AddPlayerDataArrays < ActiveRecord::Migration[5.0]
  def change
  	add_column :teams, :player_1, :integer, array:true, default: []
  	add_column :teams, :player_2, :integer, array:true, default: []
  	add_column :teams, :player_3, :integer, array:true, default: []
  	add_column :teams, :player_4, :integer, array:true, default: []
  	add_column :teams, :player_5, :integer, array:true, default: []
  	add_column :teams, :player_6, :integer, array:true, default: []
  	add_column :teams, :player_7, :integer, array:true, default: []
  	add_column :teams, :player_8, :integer, array:true, default: []
  	add_column :teams, :player_9, :integer, array:true, default: []
  end
end
