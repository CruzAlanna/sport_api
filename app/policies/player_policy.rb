class PlayerPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  attr_reader :user, :player
  
  def initialize(user, player)
    @user = user
    @player = player
  end
  
  def index?
    true
  end
  
  def show?
    team = Team.find(player.team_id) #accessing the teams table
    team.user_id == user.id || user.admin?
  end
  
  def create?
    true
  end
  
  def update?
    user.admin?
  end
  
  def destroy?
    user.admin?
  end
end
