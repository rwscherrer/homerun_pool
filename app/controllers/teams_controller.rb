class TeamsController < ApplicationController
    before_action:authenticate_user!

  
	def index
	  @teams = Team.all
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
	   flash[:success] = ["You've completed the rental application"]
	   redirect_to "/clients/#{@rental.client_id}/status"
	 else
	   flash.now[:danger] = @rental.errors.full_messages
	   render :new
	 end
	end

	def show
	 team = Team.find(params[:id]) if current_user
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
