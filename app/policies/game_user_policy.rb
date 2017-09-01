class GameUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: @user).where(finished: true).reverse
    end
  end

  def intro?
  	true
  end
  def intro_recruitment?
    true
  end
end
