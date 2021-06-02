class BroadcastsController < ApplicationController
  def new
    @tour = Tour.find(params[:tour_id])
    @broadcast = Broadcast.new
    authorize @broadcast
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @broadcast = Broadcast.new(broadcast_params)
    @broadcast.broadcastable = broadcastable
    authorize @broadcast
    if @broadcast.save
      @broadcast.broadcastable.users.each do |user|
        notif = Notification.create!(user: user, notifiable: @broadcast)
        template = render_to_string(partial: 'notifications/notification', locals: { notification: notif })
        User::NotificationChannel.broadcast_to(user, { template: template })
      end
      redirect_to @tour
    else
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
