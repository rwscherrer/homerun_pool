class TeamsController < ApplicationController
    before_action:authenticate_user!

  
	def index
	  @user = User.find(current_user.id)
	  @teams = Team.where(user_id: @user.id)
	  @all_teams = Team.all
	 
	end

  	def new
  	  @team = Team.new
  	end

	def create
	  @id = current_user.id
	  @team = Team.new({
	    user_id: @id,
	    team_name: params[:team_name],
	    score: params[:score],
	    })
	 if @team.save
	   flash[:success] = ["You've created a team!"]
	   redirect_to "/teams/"
	 else
	   flash.now[:danger] = ["Something went wrong"]
	   render :new
	 end
	end

	def show
	 @team = Team.find(params[:id]) if current_user
	 @players = []
	 @team_players = @team.team_players

	 @team_players.each do |player_id|
	 	player = Player.find_by(id: player_id)
	 	@players << player
	 end

	 def team_total
	 	@team = Team.find(params[:id]) if current_user
	 	@team_runs = []
	 	@team_players = @team.team_players

	 	@team_players.each do |player_id|
	 		player = Player.find_by(id: player_id)
	 		@team_runs << player.home_runs
	 	end

	 end



	end

	def edit
	  @team = Team.find(params[:id]) if current_user
	end

	def destroy
	  @team = Team.find(params[:id]) if current_user
	    
	  if @team.destroy
	    flash[:success] = "Team Deleted."
	    redirect_to "/users/#{current_user.id}"
	  else
	    flash.now[:warning] = @team.errors.full_messages
	    render :show
	  end
	end
end
