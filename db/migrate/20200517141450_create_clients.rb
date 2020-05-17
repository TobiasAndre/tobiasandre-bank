class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :identity
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
