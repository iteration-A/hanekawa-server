class TestController < ApplicationController
  def index
    render json: { ok: true, user: current_user }
  end
end
