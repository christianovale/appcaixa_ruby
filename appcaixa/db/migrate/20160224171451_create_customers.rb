class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :nome
      t.date :datanascimento
      t.string :email
      t.string :endereco

      t.timestamps null: false
    end
  end
end
