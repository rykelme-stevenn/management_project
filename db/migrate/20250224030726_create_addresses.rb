class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :number, null: false
      t.string :complement
      t.string :neighborhood
      t.string :city, null: false
      t.string :state, null: false
      t.string :postal_code, null: false
      t.string :country, default: 'Brasil'
      t.timestamps
    end
  end
end
