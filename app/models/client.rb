# frozen_string_literal: true

class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :identity, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  has_many :bank_accounts

  before_save :format_name

  def format_name
    self.first_name = first_name.upcase
    self.last_name = first_name.upcase
  end

  def num_accounts
    bank_accounts.count
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
