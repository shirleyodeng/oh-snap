class PhotographerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    user_is_photographer?
  end

  def destroy?
    user_is_photographer?
  end

  private

  def user_is_photographer?
    record.user == user
  end
end
