json.array!(@availabilities) do |event|
  json.extract! event, :id
  json.title event.employee.name
  json.start event.start_time
  json.end event.end_time
  json.url admin_activity_availabilities_path(event, format: :html)
end

