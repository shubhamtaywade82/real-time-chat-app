class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_room_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = Message.create!(content: data['content'], user: current_user)
    ActionCable.server.broadcast(
      "chat_room_#{params[:room_id]}", message: render_message(message),
                                       user: message.user.username
    )
  end

  private

  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: { message: })
  end
end
