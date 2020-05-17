FactoryBot.define do
  factory :bank_account do
    balance { 0.0 }
    currency { FFaker::Currency.symbol }
    account_number { FFaker::Bank.iban }
    client
    account_type
  end
end
