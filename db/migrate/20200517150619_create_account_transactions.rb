class CreateAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :account_transactions do |t|
      t.decimal :amount
      t.string :transaction_number
      t.string :description
      t.references :transaction_type, foreign_key: true
      t.references :origin_bank_account, foreign_key: { to_table: 'bank_accounts' }
      t.references :destination_bank_account, foreign_key: { to_table: 'bank_accounts' }
      t.timestamps
    end
  end
end
