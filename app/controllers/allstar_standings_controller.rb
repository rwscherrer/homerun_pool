class AllstarStandingsController < ApplicationController
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

	  def rank
	  	@teams = Team.all
	  	@teams_count = Team.count

	  	@teams.each do |team|
	  		team.score = players.home_runs_2017
	  		team.save
	  	end

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
end
