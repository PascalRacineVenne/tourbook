class ToursController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = policy_scope(Tour).select { |tour| tour.users.include?(current_user) }
    @tour = Tour.new
  end

  # def new
  #   @tour = Tour.new
  #   authorize @tour
  # end

  def create
    @tour = Tour.new(tour_params)
    tour_member = TourMember.new(tour: @tour, administrator: true)
    tour_member.user = current_user if tour_member.user.nil?
    tour_member.save
    authorize @tour
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render 'tours/index'
    end
  end

  def show
    @events = @tour.events.order(show_start_at: :asc)
    @tour_members = @tour.tour_members
    @event = Event.create
  end

  # def edit
  # end

  def update
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour.destroy
    redirect_to root_path
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def tour_params
    params.require(:tour).permit(:name, :artist_name, :logo, tour_members_attributes: [:id, :job_title, :user_id, :_destroy])
  end
end
