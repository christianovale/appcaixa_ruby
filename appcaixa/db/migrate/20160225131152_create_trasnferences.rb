class CreateTrasnferences < ActiveRecord::Migration
  def change
    create_table :trasnferences do |t|
      t.date :data
      t.decimal :valor
      t.integer :contadestino

      t.timestamps null: false
    end
  end
end
