class ChatRoomsController < ApplicationController
  before_action :authorize_request

  def index
    render json: { rooms: ChatRoom.order(:created_at).limit(50) }
  end

  def create
    chat_room = ChatRoom.new(chat_room_params)
    if chat_room.save
      render json: { chat_room: }, status: :created
    else
      render json: { errors: chat_room.errors }, status: :unprocessable_entity
    end
  end

  def show
    chat_room = ChatRoom.find_by_topic!(params[:topic])

    render json: { chat_room: }, include: { messages: { include: :user } }, status: :ok
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:topic)
  end
end
