class CreateWhithdraws < ActiveRecord::Migration
  def change
    create_table :whithdraws do |t|
      t.date :data
      t.decimal :valor
      t.references :account, index: true

      t.timestamps null: false
    end
    add_foreign_key :whithdraws, :accounts
  end
end
