class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)
       if  @event.save 
            flash[:notice] = "Event Created Successfully"
            redirect_to events_path
        else
            flash.now[:alert] = "Form not submitting for some reasons"
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end 
end

