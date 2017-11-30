@activity = Activity.find(params[:id])

json.array!(@activity.availabilities) do |availability|
  json.extract! availability, :id
  json.title "#{availability.employee.first_name} #{availability.employee.last_name}"
  json.start availability.start_time
  json.end availability.end_time
  json.url admin_activity_availability_path(availability.activity_id, availability.id,  format: :html)
end
