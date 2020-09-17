class EventsController < ApplicationController

  def index
    @events = Event.all 
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    user_options
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      flash[:notice] = "Event successfully created!"
      redirect_to events_path
    else
      user_options
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :time, attendee_ids: [] )
  end

  def user_options
    @user_options = User.all.map{ |u| [ u.name, u.id ]}
  end
end
