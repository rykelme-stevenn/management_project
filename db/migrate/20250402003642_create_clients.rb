class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date   :birth_date, null: false
      t.text   :observation
      t.string :tel_main
      t.string :tel_sec
      t.string :email
      t.references :address, foreign_key: { to_table: :addresses }
      t.references :work_address, foreign_key: { to_table: :addresses }
      t.timestamps
    end
  end
end
