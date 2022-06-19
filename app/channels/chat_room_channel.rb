class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    reject unless room_exists?

    stream_from @channel
    ActionCable.server.broadcast @channel, {
      message: 'user_joined',
      data: {
        user: current_user.username
      }
    }
  end

  def unsubscribed
    ActionCable.server.broadcast @channel, {
      message: 'user_left',
      data: {
        user: current_user.username
      }
    }
  end

  def message(data)
    msg = @room.messages.new(content: data['content'], user: current_user)

    if msg.save
      ActionCable.server.broadcast @channel, {
        message: 'new_message',
        data: msg
      }
    else
      transmit({
                 message: 'bad_request',
                 data: msg.errors
               })
    end
  end

  private

  def room_exists?
    @room = ChatRoom.find_by_topic(params['topic'])
    @channel = "chat_room_#{@room.topic}"

    @room
  end
end
