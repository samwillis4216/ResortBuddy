class Availability < ApplicationRecord
  belongs_to :activity
  belongs_to :employee
end
