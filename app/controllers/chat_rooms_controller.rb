class ChatRoomsController < ApplicationController
  before_action :authorize_request

  def index
    render json: { rooms: ChatRoom.all }
  end
end
