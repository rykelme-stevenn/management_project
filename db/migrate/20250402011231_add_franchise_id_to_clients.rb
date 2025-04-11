class AddFranchiseIdToClients < ActiveRecord::Migration[8.0]
  def change
    add_reference :clients, :franchise, foreign_key: true
  end
end
