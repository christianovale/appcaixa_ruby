class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :saldo
      t.boolean :ativa
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounts, :customers
  end
end
