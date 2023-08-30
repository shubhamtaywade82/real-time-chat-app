class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @chat_rooms = ChatRoom.public_rooms
    @users = User.all_except(@current_user)
    @chat_room = ChatRoom.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @chat_room = ChatRoom.where(name: @room_name).first || ChatRoom.create_private_room([@user, @current_user],
                                                                                          @room_name)
    @messages = @chat_room.messages

    render 'chat_rooms/index'
  end

  private

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
