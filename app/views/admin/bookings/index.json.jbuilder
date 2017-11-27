json.array!(@bookings, @availabilities) do |event|
  json.extract! event, :id
  json.title "Current no of ppl #{event.no_ppl}/#{event.availability_id}"
  json.start event.availability.start_time
  json.backgroundColor "#56CCF2"
  json.end event.availability.end_time
  json.url admin_bookings_path(event, format: :html)
end

