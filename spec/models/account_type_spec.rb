# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountType, type: :model do
  context 'when creating a new account type' do
    it 'is valid' do
      account_type = create(:account_type)
      expect(account_type).to be_valid
    end
  end
end
