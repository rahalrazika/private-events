class EventsController < ApplicationController
  def index
    @pasts = Event.past
    @upcomings = Event.upcoming
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Event Created Successfully'
      redirect_to events_path
    else
      flash.now[:alert] = 'Form not submitting for some reasons'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def register
    @ea = EventAttendance.new(attended_event_id: params[:id], attendee_id: session[:user_id])
    if @ea.save
      flash[:notice] = 'Register sucessfully'
      redirect_to events_path
    else
      flash[:alert] = 'Register not sucessfull'
    end
  end
end
