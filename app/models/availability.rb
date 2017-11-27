class Availability < ApplicationRecord
  belongs_to :activity
  belongs_to :employee
  has_many :bookings, dependent: :destroy
  has_one :chatroom
end
