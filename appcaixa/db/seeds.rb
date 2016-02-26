# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(nome:Antonio Coutinho nascimento:today email:antoniocoutinho@mail.com endereco:rua das Couves 213)
Account.create(saldo:100 ativa:true customer_id:1)
Customer.create(nome:Joao da Silva nascimento:today email:joaosilva@mail.com endereco:rua dos Ipes 44)
Account.create(saldo:100 ativa:true customer_id:2)