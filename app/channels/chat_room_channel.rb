class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    reject unless room_exists?

    stream_from @channel
    ActionCable.server.broadcast @channel, {
      type: 'user_joined',
      data: {
        user: current_user.username
      }
    }
  end

  def unsubscribed
    ActionCable.server.broadcast @channel, {
      type: 'user_left',
      data: {
        user: current_user.username
      }
    }
  end

  def message(data)
    msg = @room.messages.new(content: data['content'], user: current_user)

    if msg.save
      ActionCable.server.broadcast @channel, {
        type: 'new_message',
        data: {
          content: msg.content,
          username: User.find(msg.user_id).username
        }
      }
    else
      transmit({
                 type: 'bad_request',
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
