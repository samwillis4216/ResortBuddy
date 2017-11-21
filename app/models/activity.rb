class Activity < ApplicationRecord
  has_many :availabilities, dependent: :destroy
end
