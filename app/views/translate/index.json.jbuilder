json.array!(@translates) do |translate|
  json.extract! translate, :id
  json.url translate_url(translate, format: :json)
end
