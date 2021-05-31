class BroadcastsController < ApplicationController
  def new
    @tour = Tour.find(params[:tour_id])
    @broadcast = Broadcast.new
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @broadcast = Broadcast.new(broadcast_params)
    @broadcast.broadcastable = broadcastable
    if @broadcast.save
      redirect_to @tour
    else
    # raise
      render :new
    end
  end

  private

  def broadcastable
    if broadcast_params[:broadcastable_id].present?
      Event.find(broadcast_params[:broadcastable_id])
    else
      @tour
    end
  end

  def broadcast_params
    params.require(:broadcast).permit(:name, :content, :broadcastable_id)
  end
end
