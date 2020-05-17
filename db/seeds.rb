# frozen_string_literal: true
require 'ffaker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AccountType.create(title: 'Deposit', min_deposit: 10.0)
AccountType.create(title: 'Savings Accounts', min_deposit: 10.0)
deposit = TransactionType.create(name: 'deposit')
withdraw = TransactionType.create(name: 'withdraw')
transfer = TransactionType.create(name: 'transfer')
default_currency = FFaker::Currency.symbol

5.times do
  user = User.create(name: FFaker::Name.name, surname: FFaker::Name.last_name)

  client = Client.create(first_name: FFaker::Name.first_name,
                         last_name: FFaker::Name.last_name,
                         gender: FFaker::Identification.gender,
                         identity: FFaker::Identification.ssn,
                         phone: FFaker::PhoneNumber.phone_number,
                         email: FFaker::Internet.email)
  
  UserClient.create(user_id: user.id, client_id: client.id)
  
  BankAccount.create(currency: default_currency,
                     account_number: FFaker::Bank.iban,
                     client: client, account_type: AccountType.first)

end

