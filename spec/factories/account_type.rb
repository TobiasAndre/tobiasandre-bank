FactoryBot.define do
  factory :account_type do
    title { 'Basic Checking Accounts' }
    min_deposit { 10.0 }
  end
end
