class TourMembersController < ApplicationController
  before_action :set_tour_member, only: [:edit, :update, :destroy]

  def new
    @tour = Tour.find(params[:tour_id])
    @tour_member = TourMember.new
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @tour_member = TourMember.new(tour_member_params)
    @tour_member.administrator = true
    @tour_member.tour_id = @tour.id
    if @tour_member.save
      redirect_to tour_path(@tour), notice: 'Your tour member was successfully created.'
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:tour_id])
    @event = Event.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:tour_id])
    @tour_member = TourMember.find(params[:id])
    if @tour_member.update(tour_member_params)
      redirect_to event_path(@event), notice: 'Your event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def set_tour_member
    @tour_member = TourMember.find(params[:id])
  end

  def tour_member_params
    params.require(:tour_member).permit(:job_title, :administrator, :tour_id)
  end
end
