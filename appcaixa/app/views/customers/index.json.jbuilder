json.array!(@customers) do |customer|
  json.extract! customer, :id, :nome, :datanascimento, :email, :endereco
  json.url customer_url(customer, format: :json)
end
