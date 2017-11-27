@my_availabilities = Availability.where('employee_id = ?', current_employee.id)
# @ppl = Booking.where("availability_id = #{availability.id}")

json.array!(@my_availabilities) do |availability|
  json.extract! availability, :id
  json.title availability.activity.name
  json.start availability.start_time
  json.backgroundColor "#56CCF2"
  json.end availability.end_time
  json.url admin_my_activities2_path(availability, format: :html)
end



