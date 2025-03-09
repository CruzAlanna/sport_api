class Api::V1::TeamsController < ApplicationController
  before_action :authorize_request, except: [:index]

  def index
    teams = policy_scope(Team)
    render json: teams
  end

  def create
    team = Team.new(
      name: params[:name],
      user_id: params[:user_id]
    )
    authorize team

    if team.save
      render json: team, status: :created
    else
      render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    team = Team.find(params[:id])
    authorize team
    render json: team
  end

  def update
    team = Team.find(params[:id])
    authorize team
    
    if team.update(
      name: params[:name] || team.name,
      user_id: params[:user_id] || team.user_id
      )
      render json: team
    else
      render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    team = Team.find(params[:id])
    authorize team
    team.destroy!
    render json: { message: 'Team deleted' }, status: :ok
  end
end
