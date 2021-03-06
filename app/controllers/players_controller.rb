class PlayersController < ApplicationController
  attr_accessor :teams

  require 'csv'


  def index
  	@players = Player.all.order("home_runs_2017 DESC")


    @player_update = Player.all.order("updated_at DESC").limit(1)[0]

    
    def search
      @players = Player.where("first_name ILIKE ? OR last_name ILIKE ? OR mlb_team ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      render :index

    end

  end

  def search
      @players = Player.where("first_name ILIKE ? OR last_name ILIKE ? OR mlb_team ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      render :index
  end


  def show
  	@player = Player.order(home_runs_2017: :desc).find(params[:id])
  end

  def import
    CSV.foreach("update.csv", headers: true) do |row|
      @player = Player.create({
        id: row["id"],
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
        mlb_team_id: row["team_id"],
        team_abbr: row["team_abbr"],
        team_city: row["team_city"],
        mlb_team: row["team_name"],
        games_played: row["games_played"],
        home_runs_2017: row["home_runs_2017"],
        home_runs_allowed: row["home_runs_allowed"],
        home_runs_2016: row["home_runs_2016"],
        
      })
    end
  end

  def new
  	@player = Player.new
  end

end
