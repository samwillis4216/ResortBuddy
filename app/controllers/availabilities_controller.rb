class AvailabilitiesController < ApplicationController

  def show
    @availability = Availability.find(params[:id])
    @chatroom = Chatroom.find(@availability.chatroom.id)
    @message = Message.new
    @messages = @chatroom.messages
  end

end

