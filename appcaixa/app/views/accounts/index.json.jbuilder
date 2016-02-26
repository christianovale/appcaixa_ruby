json.array!(@accounts) do |account|
  json.extract! account, :id, :saldo, :ativa, :customer_id
  json.url account_url(account, format: :json)
end
