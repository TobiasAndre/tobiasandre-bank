# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  context 'when creating a new transaction type' do
    it 'is valid' do
      transaction_type = create(:transaction_type)
      expect(transaction_type).to be_valid
    end
  end
end
