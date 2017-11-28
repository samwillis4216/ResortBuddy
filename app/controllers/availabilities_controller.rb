class AvailabilitiesController < ApplicationController
  layout "guest"

  def show
    @availability = Availability.find(params[:id])
    @chatroom = Chatroom.find(@availability.chatroom.id)
    @message = Message.new
    @messages = @chatroom.messages
    @booking = @availability.bookings.where(guest_id: current_guest.id).first
  end

end

