class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to tour_path(@tour), notice: 'Your tour was successfully created.'
    else
      render :new
    end
  end

  def show
    @events = @tour.events
  end

  def edit
  end

  def update
    @tour.update(tour_params)
    redirect_to tour_path(@tour), notice: 'Your tour was successfully updated.'
  end

  def destroy
    @tour.destroy
    redirect_to tours_path, notice: 'Your tour was successfully deleted.'
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :artist_name, :logo_url)
  end
end
