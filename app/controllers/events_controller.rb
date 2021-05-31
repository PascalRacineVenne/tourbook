class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def show
    @tour_id = @event.tour_id
    @tour = Tour.find(@tour_id)
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @event = Event.new(event_params)
    @event.tour_id = params[:tour_id]
    # authorize @event
    if @event.save
      redirect_to tour_path(@tour)
      # raise
    else
      render 'tours/show'
    end
  end

  def update
    @tour_id = @event.tour_id
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
      # raise
    else
      render 'events/show'
    end
  end

  def destroy
    @tour_id = @event.tour_id
    @event.destroy
    redirect_to tour_path(Tour.find(@tour_id))
  end

  private

  def set_event
    @event = Event.find(params[:id])
    # dt = @event.show_start_at
    # @event.time = dt.strftime("%I:%M%p")
    # @event.date = dt.strftime("%a %b %d")
    # authorize @event
  end

  def event_params
    params.require(:event).permit(:show_start_at, :venue, :city, :schedule, :tour_id, tour_members_attributes: [:id, :job_title, :user_id, :_destroy])
  end
end
