# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountTransaction, type: :model do
  context 'when creating a new transaction' do
    it 'is valid' do
      account_transaction = create(:account_transaction)
      expect(account_transaction).to be_valid
    end
  end
end
