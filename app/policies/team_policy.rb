class TeamPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
  
  attr_reader :user, :team

  def initialize(user, team)
    @user = user
    @team = team
  end

  def index?
    true
  end

  def show?
    team.user_id == user.id || user.coach? || user.admin?
  end

  def create?
    user.coach? || user.admin?
  end

  def update?
    user.coach? || user.admin?
  end

  def destroy?
    user.admin?
  end
end


