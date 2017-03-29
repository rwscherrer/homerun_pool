class AddColumnsToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :player_last_name, :string
  	add_column :players, :player_first_name, :string
  	add_column :players, :jersey_num, :integer
  	add_column :players, :position, :string
  	add_column :players, :height, :string
  	add_column :players, :weight, :string
  	add_column :players, :birth_date, :string
  	add_column :players, :age, :integer
  	add_column :players, :birth_city, :string
  	add_column :players, :birth_country, :string
  	add_column :players, :rookie, :string
  	add_column :players, :mlb_id, :integer
  	add_column :players, :team_abbr, :string
  	add_column :players, :team_city, :string
  	add_column :players, :games_played, :integer
  	add_column :players, :home_runs_allowed, :integer
  end
end
