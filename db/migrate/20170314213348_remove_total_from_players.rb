class RemoveTotalFromPlayers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :players, :total, :string
  end
end
