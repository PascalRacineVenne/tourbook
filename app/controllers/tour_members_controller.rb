class TourMembersController < ApplicationController

  def create
    # We want this new tour member to be assigned to all the events of this specific tour.
    @tour_member = TourMember.create(set_tour_member)
  end

  def update
    # We want this tour member to be updated for all the events of this specific tour.
    tour_member.update(set_tour_member_for_update)
  end

  def destroy
    # We want this tour member to be deleted from all the events of this specific tour.

  end

  private

  def set_tour_member
    # Should not permit the event_id,
    params.require(:tour_member).permit(:job_title, :user_id, :event_id)
  end

  def set_tour_member_for_update
    params.require(:tour_member).permit(:user_id)
  end
end
