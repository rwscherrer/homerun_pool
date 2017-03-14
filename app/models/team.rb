class Team < ApplicationRecord
	belongs_to :user
	has_many :players


	def player_list
	  players = []
	  players.each do |player|
	    if player.team.id
	    players << player.name
	    end
	  end
	end
end
