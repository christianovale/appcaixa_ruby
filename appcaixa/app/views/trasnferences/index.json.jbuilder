json.array!(@trasnferences) do |trasnference|
  json.extract! trasnference, :id, :data, :valor, :contadestino
  json.url trasnference_url(trasnference, format: :json)
end
