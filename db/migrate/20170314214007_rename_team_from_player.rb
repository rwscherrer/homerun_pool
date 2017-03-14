class RenameTeamFromPlayer < ActiveRecord::Migration[5.0]
  def change
  	rename_column :players, :team, :mlb_team
  end
end
