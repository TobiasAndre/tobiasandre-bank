FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    surname { FFaker::Name.last_name }
  end
end
