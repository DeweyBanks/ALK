json.array!(@courses) do |course|
  json.extract! course, :id, :title, :start_date, :end_date, :kid_id
  json.url course_url(course, format: :json)
end
