class TeamsController < ApplicationController
    before_action:authenticate_user!

  
	def index
	  @user = User.find(current_user.id)
	  @teams = Team.where(user_id: @user.id)
	  @all_teams = Team.all

	  
	  def sort_column
	    Team.column_names.include?(params[:sort]) ? params[:sort] : "name"
	  end
		  
	  def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	  end

	  require 'net/http'
	  require 'net/https'

	  # # Request (GET )
	  # def send_request
	  #   uri = URI("https://www.mysportsfeeds.com/api/feed/pull/mlb/2016-regular/cumulative_player_stats.json?playerstats=HR")

	  #   # Create client
	  #   http = Net::HTTP.new(uri.host, uri.port)
	  #   http.use_ssl = true
	  #   http.verify_mode = OpenSSL::SSL::VERIFY_PEER

	  #   # Create Request
	  #   req =  Net::HTTP::Get.new(uri)
	  #   # Add headers
	  #   req.add_field "Authorization", "Basic " + base64_encode({username} + ":" + {password})

	  #   # Fetch Request
	  #   res = http.request(req)
	  #   puts "Response HTTP Status Code: #{res.code}"
	  #   puts "Response HTTP Response Body: #{res.body}"
	  # rescue StandardError => e
	  #   puts "HTTP Request failed (#{e.message})"
	  # end

	 
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
