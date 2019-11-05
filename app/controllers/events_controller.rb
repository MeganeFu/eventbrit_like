class EventsController < ApplicationController
	before_action :authenticate_user
	
	def new
		@event = Event.new
	end
	
	def show
		@event = Event.find(params[:id])
	end
	
	 def create
		 
		@event = Event.new
		@event.title = params[:title]
		@event.description = params[:description]
		@event.location = params[:location]
		@event.price = params[:price]
		@event.duration = params[:duration]
		@event.start_date = params[:start_date]
		@event.user = current_user
		@event.save
		
		if @event.save
			flash[:success] = "Tu as ajouter ton super potin."
			redirect_to root_path
			
		else render "new"

	end
	end
	
	   def authenticate_user
        unless current_user
            flash.now[:alert] = "Email ou mot de passe invalide"
            redirect_to new_user_session_path
        end
    end
	
end

