class Booking < ApplicationRecord
  belongs_to :availability
  belongs_to :guest
end
