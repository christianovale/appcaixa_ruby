class Customer < ActiveRecord::Base
	validates :nome, presence:true
	validates :email, presence:true
	validates :datanascimento, presence:true
	validates :endereco, presence:true

	has_one :account
end
