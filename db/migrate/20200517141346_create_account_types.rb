class CreateAccountTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :account_types do |t|
      t.string :title
      t.decimal :min_deposit
      t.timestamps
    end
  end
end
