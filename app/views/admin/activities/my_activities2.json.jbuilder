def get_color(availability)
  capacity = availability.activity.capacity
  sumofppl = 0

  availability.bookings.each do |booking|
    sumofppl += booking.no_ppl
  end

  if sumofppl == 0
    return "#FA403C"
  elsif sumofppl > 0 && sumofppl < capacity
    return "#1774F0"
  else
    return "#66ee78"
  end
end

json.array!(@my_availabilities) do |availability|
  json.extract! availability, :id
  json.title availability.activity.name
  json.start availability.start_time
  json.backgroundColor "#{
  get_color(availability)}"
  json.end availability.end_time
  json.url admin_activity_availability_path(availability.activity_id, availability.id,  format: :html)
end




