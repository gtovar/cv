json.array!(@experiences) do |experience|
  json.extract! experience, :id, :name, :description, :start_date, :end_date
  json.url experience_url(experience, format: :json)
end
