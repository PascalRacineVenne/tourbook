class BroadcastPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_tour_admin?
  end

  def new?
    true
  end

  private

  def user_tour_admin?
    tour_member = record.broadcastable.tour_members.find_by(user: user)
    record.broadcastable.users.include?(user) && tour_member.administrator
  end
end
