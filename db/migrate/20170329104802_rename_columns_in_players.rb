class RenameColumnsInPlayers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :players, :player_last_name, :last_name 
  	rename_column :players, :player_first_name, :first_name
  	add_column :players, :player_id, :integer
  end
end
