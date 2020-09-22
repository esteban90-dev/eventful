class EventsController < ApplicationController
  before_action :require_login
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(host_id: current_user_id)
  end

  def show
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
  
  def edit
    user_options
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event successfully updated"
      redirect_to events_path
    else
      user_options
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event sucessfully destroyed"
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:name, :location, :time, attendee_ids: [] )
  end

  def user_options
    @user_options = User.all.map{ |u| [ u.name, u.id ]}
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
