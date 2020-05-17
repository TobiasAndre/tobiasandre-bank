# frozen_string_literal: true

class BankAccount < ApplicationRecord
  belongs_to :client
  belongs_to :account_type

  validates :client, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true

  has_many :account_transactions
end
