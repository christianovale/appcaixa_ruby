json.array!(@deposits) do |deposit|
  json.extract! deposit, :id, :data, :valor, :account_id
  json.url deposit_url(deposit, format: :json)
end
