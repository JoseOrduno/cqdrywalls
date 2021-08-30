class UsersController < ApplicationController
  skip_before_action :authorized, only: :login
  before_action :admin?, only: %i[create index]

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: "Bearer #{token}" }
    else
      render json: { error: @user.errors.messages }
    end
  end

  def index
    @user = User.all
    render json: @user
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: { name: @user.name, email: @user.email }, token: "Bearer #{token}" }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  private

  def user_params
    params.permit(:name, :lastname, :password, :email, :role)
  end
end
