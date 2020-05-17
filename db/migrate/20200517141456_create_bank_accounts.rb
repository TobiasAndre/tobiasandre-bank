class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.decimal :balance, default: 0.0
      t.string :currency
      t.string :account_number
      t.references :client, foreign_key: true
      t.references :account_type, foreign_key: true
      t.timestamps
    end
  end
end
