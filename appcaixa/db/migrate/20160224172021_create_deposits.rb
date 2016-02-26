class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.date :data
      t.decimal :valor
      t.references :account, index: true

      t.timestamps null: false
    end
    add_foreign_key :deposits, :accounts
  end
end
