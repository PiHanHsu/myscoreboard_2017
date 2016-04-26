class ApiV1::GamesController < ApiController
    # before_action :authenticate_user!
    protect_from_forgery except: :create
	  def index
		  @games = Game.where( :team_id => params[:team_id])
      #games = Record.where( :result => "W").group( :player ).count.sort_by{|k,v|v}.reverse
      #render :json => { :message => "Test"}
    end

  	def create

    	transaction = Game.transaction do
 			game = Game.create( :team_id => params[:team_id])

    		params[:scores].each do |key, value|

    			game.records.create(:game_id => game, :user_id => value["user"], :score => value["score"], :result => value["result"])
	    	end
    	end

    	if transaction
  	  		render :json => { :message => "transaction success!!! Yah!!" }
    	else
    		render :json => { :message => "transaction failed" }, :status => 401
   		end
   	end

end