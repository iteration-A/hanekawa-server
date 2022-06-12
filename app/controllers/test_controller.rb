class TestController < ApplicationController
  before_action :authorize_request, only: [:index]

  def index
    render json: { ok: true, user: @current_user }
  end
end
