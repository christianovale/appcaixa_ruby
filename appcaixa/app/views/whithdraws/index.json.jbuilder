json.array!(@whithdraws) do |whithdraw|
  json.extract! whithdraw, :id, :data, :valor, :account_id
  json.url whithdraw_url(whithdraw, format: :json)
end
