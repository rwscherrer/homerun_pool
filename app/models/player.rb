class Player < ApplicationRecord
	has_many :teams
	has_many :users, through: :teams

	def change
	  create_table :name do |t|
	    t.column :name, :string
	  end
	end
end
