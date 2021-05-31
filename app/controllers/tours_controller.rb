class ToursController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show
  before_action :set_tour, only: [:show, :update, :destroy]

  def index
    @tours = policy_scope(Tour).select { |tour| tour.users.include?(current_user) }
    # @tours = Tour.all
    @users = User.all
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    # @tour_member = TourMember.new(event: @event, job_title: 'Manager', administrator: true)
    # @tour_member.user = current_user if tour_member.user.nil?
    authorize @tour
    if @tour.save
      add_event
      add_current_member
      redirect_to tour_path(@tour)
    else
      render 'tours/index'
    end
  end

  def show
    @event = Event.create
    @events = @tour.events.order(show_start_at: :asc)
    @tour_members = @event.tour_members
  end

  def update
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour.destroy
    redirect_to root_path
  end

  def add_event
    @event = Event.new(show_start_at: params.dig(:tour, :event)[:show_start_at])
    # @event = Event.new(tour_params)
    @event.tour = @tour
    @event.save
  end

  def add_current_member
    # att = params.dig(:tour, :event, :tour_members)
    # @tour_member = TourMember.new(job_title: att[:job_title], user_id: att[:user])
    # @tour_member.event = @event
    # @tour_member.save

    @tour_member = TourMember.new(event: @event, job_title: 'Manager', administrator: true)
    @tour_member.user = current_user if @tour_member.user.nil?
    @tour_member.save
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
    # authorize @tour
  end

  def tour_params
    params.require(:tour).permit(:name, :artist_name, :logo, events_attributes: [:id, :show_start_at])
  end

  def event_params
    params.require(params.dig(:tour, :event)).permit(:show_start_at)
  end

  def tour_member_params

  end
end
