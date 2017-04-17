class TeamsController < ApplicationController
    before_action:authenticate_user!
    autocomplete :player, :name

  
	def index
	  @user = User.find(current_user.id)
	  @teams = Team.where(user_id: @user.id)
	  @all_teams = Team.all.order(score: :desc)

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
	  def search
	    @player = Player.where("name LIKE ? OR mlb_team LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
	    render :show
	  end

	 
	end

	def show
	 @team = Team.find(params[:id])
	 @team_score = @team.player_1_data[0].to_i + @team.player_2_data[0].to_i +  @team.player_3_data[0].to_i + @team.player_4_data[0].to_i + @team.player_5_data[0].to_i + @team.player_6_data[0].to_i + @team.player_7_data[0].to_i + @team.player_8_data[0].to_i + @team.player_9_data[0].to_i

	end

	def edit
	  @team = Team.find(params[:id]) if current_user
	end

	def new
	  @team = Team.new
	  @players = Player.all
	  @count = 0

	end


	def create
	  @team = Team.create(team_params.merge(user_id: current_user.id))
	  @team_score = @team.player_1_data[0].to_i + @team.player_2_data[0].to_i + @team.player_3_data[0].to_i + @team.player_4_data[0].to_i + @team.player_5_data[0].to_i + @team.player_6_data[0].to_i + @team.player_7_data[0].to_i + @team.player_8_data[0].to_i + @team.player_9_data[0].to_i
	  @team.update_attribute(:score, @team_score)

	  @team.player_1_data << Player.find_by(name: @team.player_1).home_runs_2017
	  @team.player_2_data << Player.find_by(name: @team.player_2).home_runs_2017
	  @team.player_3_data << Player.find_by(name: @team.player_3).home_runs_2017
	  @team.player_4_data << Player.find_by(name: @team.player_4).home_runs_2017
	  @team.player_5_data << Player.find_by(name: @team.player_5).home_runs_2017
	  @team.player_6_data << Player.find_by(name: @team.player_6).home_runs_2017
	  @team.player_7_data << Player.find_by(name: @team.player_7).home_runs_2017
	  @team.player_8_data << Player.find_by(name: @team.player_8).home_runs_2017
	  @team.player_9_data << Player.find_by(name: @team.player_9).home_runs_2017
	  @team.save

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
	    team_name: params[:team_name],
	    score: @team_score,
	    player_1: params[:player_1],
	    player_2: params[:player_2],
	    player_3: params[:player_3],
	    player_4: params[:player_4],
	    player_5: params[:player_5],
	    player_6: params[:player_6],
	    player_7: params[:player_7],
	    player_8: params[:player_8],
	    player_9: params[:player_9],
	    player_1_data: Player.find_by(name: @team.player_1).home_runs_2017,
	    player_2_data: Player.find_by(name: @team.player_2).home_runs_2017,
	    player_3_data: Player.find_by(name: @team.player_3).home_runs_2017,
	    player_4_data: Player.find_by(name: @team.player_4).home_runs_2017,
	    player_5_data: Player.find_by(name: @team.player_5).home_runs_2017,
	    player_6_data: Player.find_by(name: @team.player_6).home_runs_2017,
	    player_7_data: Player.find_by(name: @team.player_7).home_runs_2017,
	    player_8_data: Player.find_by(name: @team.player_8).home_runs_2017,
	    player_9_data: Player.find_by(name: @team.player_9).home_runs_2017,

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
	    redirect_to "/teams/"
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
