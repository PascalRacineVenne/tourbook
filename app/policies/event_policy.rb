class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.tour.tour_members.include?(user)
  end

  def new?
    true
  end

  def create?
    user_tour_admin?
  end

  def edit?
    user_tour_admin?
  end

  def update?
    user_tour_admin?
  end

  def destroy?
    user_tour_admin?
  end

  private

  def user_tour_admin?
    tour_member = record.tour.tour_members.find_by(user: user)
    record.tour.tour_members.include?(user) && tour_member.administrator
  end
end
