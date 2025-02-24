class AddFieldsToStores < ActiveRecord::Migration[8.0]
  def change
    add_column :stores, :name, :string, null: false
    add_column :stores, :cnpj, :string, null: false
    add_column :stores, :slug, :string, null: false
    add_column :stores, :active, :boolean, default: true

    add_reference :stores, :franchise, null: false, foreign_key: true
    add_reference :stores, :address, foreign_key: true
  end
end
