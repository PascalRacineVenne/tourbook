class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
    @tour_id = @event.tour_id
    @tour = Tour.find(@tour_id)
  end

  def new
    @tour = Tour.find(params[:tour_id])
    @event = Event.new
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @event = Event.new(event_params)
    @event.tour_id = params[:tour_id]
    if @event.save
      redirect_to tour_path(@tour), notice: 'Your event was successfully created.'
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @tour_id = @event.tour_id
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Your event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tour_id = @event.tour_id
    @event.destroy
    redirect_to tour_path(Tour.find(@tour_id)), notice: 'Your event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :time, :schedule, :tour_id)
  end
end
