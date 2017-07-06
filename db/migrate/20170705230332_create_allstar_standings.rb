class CreateAllstarStandings < ActiveRecord::Migration[5.0]
  def change
    create_table :allstar_standings do |t|
      t.string :team_name
      t.string :coach
      t.integer :score

      t.timestamps
    end
  end
end
