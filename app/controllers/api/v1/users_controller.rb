class Api::V1::UsersController < ApplicationController
  def signup
    user = User.create(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_message }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
end
