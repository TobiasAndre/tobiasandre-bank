# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  context 'when creating a new bank account' do
    it 'is valid' do
      bank_account = create(:bank_account)
      expect(bank_account).to be_valid
    end
  end
end
