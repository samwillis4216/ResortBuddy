@my_availabilities = Availability.where('employee_id = ?', current_employee.id)


json.array!(@my_availabilities) do |availability|
  json.extract! event, :id
  json.title "Current no of ppl #{availability.activity.name}/#{event.availability_id}"
  json.start event.availability.start_time
  json.backgroundColor "#56CCF2"
  json.end event.availability.end_time
  json.url admin_bookings_path(event, format: :html)
end



