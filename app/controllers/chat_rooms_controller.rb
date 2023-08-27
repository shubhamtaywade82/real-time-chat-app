class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    puts params
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      redirect_to chat_rooms_url(@chat_room), notice: 'Chat room was successfully created.'
    else
      render :new
    end
  end

  def join
    @chat_room = ChatRoom.find(params[:id])
    # Implement your logic for joining the chat room here
  end

  def chat_room_params
    params.require(:chat_room).permit(:name, :privacy)
  end
end
