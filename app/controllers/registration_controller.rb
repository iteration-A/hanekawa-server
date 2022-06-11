class RegistrationController < ApplicationController
  def signup
    user = User.new(user_params)

    if user.save
      render json: { user: }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
