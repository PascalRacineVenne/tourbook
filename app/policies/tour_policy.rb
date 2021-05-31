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
    tour_member = record.tour_members.find_by(user: user)
    record.tour_members.include?(user) && tour_member.administrator
  end

end
