class TastingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user_is_admin?
  end

  def update?
    user_is_admin?
  end

  private
  def user_is_admin?
    user.admin == true
  end
end
