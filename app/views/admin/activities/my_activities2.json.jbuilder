def get_color(availability)
  capacity = availability.activity.capacity
  sumofppl = 0

  availability.bookings.each do |booking|
    sumofppl += booking.no_ppl
  end

  if sumofppl == 0
    return "#66ee78"
  elsif sumofppl > 0 && sumofppl < capacity
    return "#1774F0"
  else
    return "#FA403C"
  end
end

json.array!(@my_availabilities) do |availability|
  json.extract! availability, :id
  json.title availability.activity.name
  json.start availability.start_time
  json.backgroundColor "#{
  get_color(availability)}"
  json.end availability.end_time
  json.url admin_my_activities2_path(availability, format: :html)
end




