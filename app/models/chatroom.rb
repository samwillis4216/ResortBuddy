class Chatroom < ApplicationRecord
  belongs_to :availability
  has_many :messages
end
