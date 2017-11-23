json.array!(@bookings) do |event|
  json.extract! event, :id
  json.title event.employee.name
  json.start event.availability.start_time
  json.end event.availability.end_time
  json.url admin_bookings_path(event, format: :html)
end

