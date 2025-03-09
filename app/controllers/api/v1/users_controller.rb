class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, only: [:index, :promote]

  def index
    users = policy_scope(User)
    render json: users
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      role: params[:role]
    )
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def promote
    user = User.find(params[:id])

    authorize user

    user.update(role: 'admin')
    render json: { message: 'User promoted to admin.'}, status: :ok
  end
end
