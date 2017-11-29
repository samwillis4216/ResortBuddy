class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.chatroom = Chatroom.find(params[:chatroom_id])
    @message.messageable = current_guest ? current_guest : current_employee
    @message.save
    notifications = []
    if @message.messageable.is_a?(Guest)
      notifications <<  Notification.create!(
                          notifiable: @message.chatroom.availability.employee,
                          notifierable: @message.messageable,
                          availability: @message.chatroom.availability
                        )
    else
      @message.chatroom.availability.bookings.each do |booking|
        notifications <<  Notification.create!(
                            notifiable: booking.guest,
                            notifierable: @message.messageable,
                            availability: @message.chatroom.availability
                          )
      end
    end
    notifiables = []
    if @message.messageable.is_a?(Guest)
      notification_partial = ApplicationController.renderer.render(
        partial: "shared/notification-employee",
        locals: { notification: notifications.first
      })
    else
      notification_partial = ApplicationController.renderer.render(
        partial: "shared/notification-guest",
        locals: { notification: notifications.first
      })
    end
    notifications.each { |notification| notifiables << notification.notifiable }
    ActionCable.server.broadcast("notifications", {
      notifications: notifications,
      notifiables: notifiables,
      notification_partial: notification_partial
    });
    respond_to do |format|
      format.html { redirect_to chat_room_path(@chat_room) }
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
