class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :foto
      t.string :phone
      t.string :role, null: false
      t.boolean :active, default: true
      t.references :store, foreign_key: true, null: true
      t.timestamps
    end
  end
end
