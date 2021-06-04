class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def show
    @tour = @event.tour
    @broadcast = Broadcast.new
    @uniq_user_ids = @event.tour_members.select(:user_id).map(&:user_id).uniq
    @uniq_tour_members = @uniq_user_ids.map { |id| @event.tour_members.find_by(user_id: id) }.sort_by { |tm| tm.user.full_name }
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @event = Event.new(event_params)
    @event.tour_id = params[:tour_id]
    # @event.tour_members = @tour.tour_members
    authorize @event
    if @event.save
      @tour.events.first.tour_members.each do |tm|
        TourMember.create(job_title: tm.job_title, event: @event, user: tm.user, administrator: true)
      end
      redirect_to tour_path(@tour)
    else
      render 'tours/show'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
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
    # raise
    authorize @event
  end

  def event_params
    params.require(:event).permit(:show_start_at, :venue, :city, :schedule, :tour_id, tour_members_attributes: [:id, :job_title, :user_id, :_destroy])
  end
end
