class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.chatroom = Chatroom.find(params[:chatroom_id])
    message.messageable = current_guest ? current_guest : current_employee
    message.save
    ActionCable.server.broadcast("chat_room_#{message.chatroom.id}", {
        body: message.body,
        sender: message.messageable.first_name
    })
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
