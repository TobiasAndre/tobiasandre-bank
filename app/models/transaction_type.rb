# frozen_string_literal: true

class TransactionType < ApplicationRecord
  validates :name, presence: true
end
