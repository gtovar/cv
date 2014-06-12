json.array!(@proyects) do |proyect|
  json.extract! proyect, :id, :name, :start_time, :end_time, :position, :activities, :outstaning, :tools, :description, :cover
  json.url proyect_url(proyect, format: :json)
end
