class TourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.users.include?(user)
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    tour_member = record.tour_members.find_by(user: user)
    record.users.include?(user) && tour_member.administrator
  end

  def update?
    tour_member = record.tour_members.find_by(user: user)
    record.users.include?(user) && tour_member.administrator
  end

  def destroy?
    tour_member = record.tour_members.find_by(user: user)
    record.users.include?(user) && tour_member.administrator
  end
end
