class ToursController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show
  before_action :set_tour, only: [:show, :update, :destroy]

  def index
    @tours = policy_scope(Tour).select { |tour| tour.users.include?(current_user) }
    @tour = Tour.new
    @tour.events.build
  end

  def create
    @tour = Tour.new(tour_params)
    add_first_event
    add_tour_members
    authorize @tour
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render 'tours/index'
    end
  end

  def show
    @event = Event.create
    @events = @tour.events.order(show_start_at: :asc)
    # raise
  end

  def update
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour.destroy
    redirect_to root_path
  end

  private

  def add_first_event
    @event = Event.new(venue: params.dig(:tour, :events_attributes, "0", :venue), city: params.dig(:tour, :events_attributes, "0", :city), show_start_at: params.dig(:tour, :events_attributes, "0", :show_start_at), schedule: params.dig(:tour, :events_attributes, "0", :schedule))
    @tour.events = [@event]
  end

  def add_tour_members
    @tour_member = TourMember.new(event: @event, job_title: 'Manager', administrator: true)
    @tour_member.user = current_user if @tour_member.user.nil?
    @tour_member.save
    if params.dig(:tour, :events_attributes, "0").permit(tour_members_attributes:[:job_title, :user_id])[:tour_members_attributes] != nil
      atts = params.dig(:tour, :events_attributes, "0").permit(tour_members_attributes:[:job_title, :user_id])[:tour_members_attributes].values
      @event.tour_members.build(atts)
    end
  end

  def set_tour
    @tour = Tour.find(params[:id])
    # authorize @tour
  end

  def tour_params
    params.require(:tour).permit(:name, :artist_name, :logo, events_attributes: [:id, :venue, :city, :show_start_at, :schedule])
  end
end
