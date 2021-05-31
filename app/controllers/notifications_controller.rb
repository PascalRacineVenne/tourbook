class NotificationsController < ApplicationController
  def index
    @broadcasts = current_user.broadcasts
  end
end
