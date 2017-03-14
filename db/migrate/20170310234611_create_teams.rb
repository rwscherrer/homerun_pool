class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
