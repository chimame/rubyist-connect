class EventsController < ApplicationController
  def index
    @events = Event.includes(participations: [:user])
      .all.order(created_at: :asc)
  end

  def new
    @event = Event.new
    @users = User.all
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, user_ids: [])
  end
end
