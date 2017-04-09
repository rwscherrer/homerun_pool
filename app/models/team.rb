class Team < ApplicationRecord
  belongs_to :user
  has_many :players


  def team_score
  	@teams = Team.all 
  	@team_score = []
  	@teams.each do |team|
  		team.update(score: team.player_1_data[0].to_i + team.player_2_data[0].to_i +  team.player_3_data[0].to_i + team.player_4_data[0].to_i + team.player_5_data[0].to_i + team.player_6_data[0].to_i + team.player_7_data[0].to_i + team.player_8_data[0].to_i + team.player_9_data[0].to_i)
  	end
  end


end
