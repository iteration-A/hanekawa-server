class SessionController < ApplicationController
  def login
    if (user = User.authenticate(params[:username], params[:password]))

      token, exp = JsonWebToken.encode(user_id: user.id)
      render json: { token:, exp:, username: user.username }, status: :ok

    else
      head :unauthorized
    end
  end
end
