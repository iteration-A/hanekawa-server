class SessionController < ApplicationController
  def login
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      head :ok
    else
      head :unauthorized
    end
  end

  def logout
    reset_session
    head :no_content
  end
end
