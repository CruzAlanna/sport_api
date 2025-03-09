class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  attr_reader :user, :target_user

  def initialize(user, target_user)
    @user = user # current user
    @target_user = target_user # user we want to promote
  end

  def index?
    true
  end

  def create?
    true
  end

  def promote?
    user.admin?
  end

end
