class EventPolicy < ApplicationPolicy
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
    record.tour.tour_members.where(user: user, administrator: true).exists?
    # record.tour.users.include?(user) && tour_member.administrator
  end
end
