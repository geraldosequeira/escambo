class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access?
  end

  class Scope < Scope
    def resolve
      user.full_access? ? scope.all.order(:ask) : scope.with_restricted_access
    end
  end
end
