class TourMembersController < ApplicationController
  before_action :set_tour_member, only: [:edit, :update, :destroy]

  def new
    @tour = Tour.find(params[:tour_id])
    @tour_member = TourMember.new
    @members = User.all.map { |user| [user.email, user.id] }
  end

  def create
    raise
    @tour = Tour.find(params[:tour_id])
    @tour_member = TourMember.new(tour_member_params)
    @tour_member.administrator = true
    @tour_member.tour = @tour
    @user = User.find(params[:tour_member][:user])
    @tour_member.user = @user
    if @tour_member.save
      redirect_to tour_path(@tour), notice: 'Your tour member was successfully created.'
    else
      render :new
    end
  end

  def edit
    @members = User.all.map { |user| [user.email, user.id] }
  end

  def update
    @user = User.find(params[:tour_member][:user])
    @tour_member.user = @user
    if @tour_member.update(tour_member_params)
      redirect_to tour_path(Tour.find(@tour_member.tour_id)), notice: 'Your tour member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tour_id = @tour_member.tour_id
    @tour_member.destroy
    redirect_to tour_path(Tour.find(@tour_id)), notice: 'Your tour member was successfully deleted.'
  end

  private

  def set_tour_member
    @tour_member = TourMember.find(params[:id])
  end

  def tour_member_params
    params.require(:tour_member).permit(:job_title, :administrator, :tour_id)
  end
end
