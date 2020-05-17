FactoryBot.define do
  factory :client do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    gender { FFaker::Identification.gender }
    identity { FFaker::Identification.ssn }
    phone { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.email }
  end
end
