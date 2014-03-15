json.array!(@translation_services) do |translation_service|
  json.extract! translation_service, :id, :name, :url
  json.url translation_service_url(translation_service, format: :json)
end
