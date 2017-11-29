class Availability < ApplicationRecord
  belongs_to :activity
  belongs_to :employee
  has_many :bookings
  has_one :chatroom
  has_many :notifications
end
