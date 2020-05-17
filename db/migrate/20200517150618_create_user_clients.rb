class CreateUserClients < ActiveRecord::Migration[6.0]
  def change
    create_table :user_clients do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
