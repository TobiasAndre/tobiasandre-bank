FactoryBot.define do
  factory :account_transaction do
    amount { 10.0 }
    description { 'transfer' }
    transaction_type
    origin_bank_account_id { create(:bank_account).id }
    destination_bank_account_id { create(:bank_account).id }
  end
end
