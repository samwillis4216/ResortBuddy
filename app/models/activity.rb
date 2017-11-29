class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :availabilities, dependent: :destroy
  belongs_to :employee
  CATEGORIES = ["Yoga", "Surfing", "Paddleboarding", "Watersports", "Snorkelling"]
  validates :name, :description, :location, presence: true
end
