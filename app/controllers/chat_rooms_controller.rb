class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat_rooms = ChatRoom.public_rooms
    @users = User.all_except(current_user)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_rooms = ChatRoom.public_rooms
    @users = User.all_except(current_user)
    @message = Message.new
    @messages = @chat_room.messages

    render :index
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      redirect_to chat_room_url(@chat_room), notice: 'Chat room was successfully created.'
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
