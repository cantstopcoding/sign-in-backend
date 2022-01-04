class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def signup
    user = User.create(user_params)
    if user.save
      render json: { token: Auth.createToken(user) }
    else
      render json: { errors: user.errors }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
end
