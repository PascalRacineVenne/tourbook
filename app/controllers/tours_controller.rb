class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_tour, only: [:show, :update, :destroy]

  def index
    @tours = policy_scope(Tour).select { |tour| tour.users.include?(current_user) }
    @tour = Tour.new
    @tour.events.build
    @tour.tour_members.build
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
    @broadcast = Broadcast.new
    @event = Event.create
    @events = @tour.events.order(show_start_at: :asc)
    @uniq_user_ids = @tour.tour_members.select(:user_id).map(&:user_id).uniq
    @uniq_tour_members = @uniq_user_ids.map { |id| @tour.tour_members.find_by(user_id: id) }.sort_by { |tm| tm.user.full_name }
  end

  def update
    @tour.update(tour_params)
    # update_all_tour_members
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
    @event.tour_members.new(user: current_user, job_title: 'Manager', administrator: true)
    # @tour_member.save
    if params.dig(:tour, :events_attributes, "0").permit(tour_members_attributes:[:job_title, :user_id])[:tour_members_attributes] != nil
      atts = params.dig(:tour, :events_attributes, "0").permit(tour_members_attributes:[:job_title, :user_id])[:tour_members_attributes].values
      @event.tour_members.build(atts)
    end
  end

  def set_tour
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def tour_params
    params.require(:tour).permit(:name, :artist_name, :logo, events_attributes: [:id, :venue, :city, :show_start_at, :schedule])
  end

  # def update_all_tour_members
  #   @tour.events.each do |event|
  #     if params.dig(:tour, :events_attributes, "0").permit(tour_members_attributes:[:job_title, :user_id])[:tour_members_attributes] != nil
  #       atts = params.dig(:tour, :events_attributes, "0").permit(tour_members_attributes:[:job_title, :user_id])[:tour_members_attributes].values
  #       event.tour_members.build(atts)
  #     end
  #   end
  # end
end
