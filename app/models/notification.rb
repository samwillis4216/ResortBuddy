class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :notifierable, polymorphic: true
  belongs_to :availability
end
