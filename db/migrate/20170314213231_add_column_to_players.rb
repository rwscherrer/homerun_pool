class AddColumnToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :home_runs, :integer
  end
end
