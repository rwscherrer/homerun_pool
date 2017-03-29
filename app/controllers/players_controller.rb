class PlayersController < ApplicationController

  require 'csv'


  def index
  	@players = Player.all
  end

  def show
  	@player = Player.find(params[:id])
  end

  def import
    CSV.foreach("MLB-2016REGULAR.csv", headers: true) do |row|
      @player = Player.create({
        last_name: row["last_name"],
        first_name: row["first_name"],
        name: row["name"],
        jersey_num: row["jersey_num"],
        position: row["position"],
        height: row["height"],
        weight: row["weight"],
        birth_date: row["birth_date"],
        age: row["age"],
        birth_city: row["birth_city"],
        birth_country: row["birth_country"],
        rookie: row["rookie"],
        mlb_team_id: row["mlb_team_id"],
        team_abbr: row["team_abbr"],
        team_city: row["team_city"],
        mlb_team: row["mlb_team"],
        games_played: row["games_played"],
        home_runs: row["home_runs"],
        home_runs_allowed: row["home_runs_allowed"]
        
      })
    end
  end

  def new
  	@player = Player.new
  end

end
