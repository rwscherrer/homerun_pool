class ChangeColumnsInPlayers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :players, :home_runs, :home_runs_2016
  	add_column :players, :home_runs_2017, :integer
  end
end
