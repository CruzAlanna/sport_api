class Api::V1::PlayersController < ApplicationController
  before_action :authorize_request

  def index
    players = policy_scope(Player)
    render json: players
  end

  def create
    player = Player.new(
      name: params[:name],
      team_id: params[:team_id]
    )
    authorize player
    
    if player.save
      render json: player, status: :created
    else
      render json: { errors: player.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    player = Player.find(params[:id])
    authorize player
    render json: player
  end

  def update
    player = Player.find(params[:id])
    authorize player
    
    if player.update(
      name: params[:name] || player.name,
      team_id: params[:team_id] || player.team_id
      )
      render json: player
    else
      render json: { errors: player.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    player = Player.find(params[:id])
    authorize player
    player.destroy!
    render json: { message: 'Player deleted' }, status: :ok
  end
end
