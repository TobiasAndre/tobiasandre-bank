# frozen_string_literal: true

class AccountTransaction < ApplicationRecord
  belongs_to :origin_bank_account, class_name: "BankAccount"
  belongs_to :destination_bank_account, class_name: "BankAccount"
  belongs_to :transaction_type

  validates :origin_bank_account, :destination_bank_account, :transaction_type, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true

  before_validation :load_transaction_number, :load_description

  def load_transaction_number
    self.transaction_number = SecureRandom.uuid if new_record?
  end

  def load_description
    if transaction_type.name == "transfer"
      build_transfer_description
    else
      self.description = transaction_type.name
    end
  end

  def build_transfer_description
    self.description = "Transfer from #{origin_bank_account.account_number}"
  end
end
