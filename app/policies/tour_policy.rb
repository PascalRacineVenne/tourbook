class TourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      true
    end

    def create?
      true
    end

    def update?
      # only tour members with administrator = true
    end
  end
end
