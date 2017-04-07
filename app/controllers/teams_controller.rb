class TeamsController < ApplicationController
    before_action:authenticate_user!
    autocomplete :player, :name

  
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

	def show
	 @team = Team.find(params[:id])
	 @players = [@team.player_1, @team.player_2, @team.player_2]

	 # @players.each do |player_id|
	 #   player = Player.find_by(id: player_id)
	 #   @players << player
	 # end

	end

	def edit
	  @team = Team.find(params[:id]) if current_user
	end

	def new
	  @team = Team.new
	  @players = Player.all
	  @count = 0

	  def search
	    @player = Player.where("name LIKE ? OR mlb_team LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
	    render :show
	  end
	end


	def create
	  @team = Team.create(team_params.merge(user_id: current_user.id))
	  if @team.save
	    flash[:success] = ["You've Completed Your Team"]
	    redirect_to '/teams'
	  else
	    flash.now[:danger] = @team.errors.full_messages
	    render :new
	  end
	end



	def update
	  @team = Team.find(params[:id]) if current_user

	  if @team.update({
	    team_name: params[:team][:team_name],
	    player_1: params[:team][:player_1],
	    player_2: params[:team][:player_2],
	    player_3: params[:team][:player_3],
	    player_4: params[:team][:player_4],
	    player_5: params[:team][:player_5],
	    player_6: params[:team][:player_6],
	    player_7: params[:team][:player_7],
	    player_8: params[:team][:player_8],
	    player_9: params[:team][:player_9]

	    })
	 
	    flash[:success] = [ "Team Updated." ]
	    redirect_to '/teams'
	  else
	    flash.now[:warning] = @team.errors.full_messages
	  end
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

	private
	  # Using a private method to encapsulate the permissible parameters is
	  # a good pattern since you'll be able to reuse the same permit
	  # list between create and update. Also, you can specialize this method
	  # with per-user checking of permissible attributes.
	  def team_params
	    params.require(:team).permit(
	    	:team_name, 
	    	:user_id, 
	    	:score, 
	    	:player_1, 
	    	:player_2, 
	    	:player_3, 
	    	:player_4, 
	    	:player_5, 
	    	:player_6, 
	    	:player_7, 
	    	:player_8, 
	    	:player_9
	    	)
	  end

end
