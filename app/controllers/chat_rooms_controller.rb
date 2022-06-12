class ChatRoomsController < ApplicationController
  def index
    render json: { rooms: ChatRoom.all }
  end
end
