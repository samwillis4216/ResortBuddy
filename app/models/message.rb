class Message < ApplicationRecord
  belongs_to :messageable, polymorphic: true
  belongs_to :chatroom

  after_create :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{self.chatroom.id}", {
      message_partial: ApplicationController.renderer.render(partial: "shared/message", locals: { message: self, user_is_messages_author: false }),
      sender: messageable
    });
  end
end
