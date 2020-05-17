# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'when creating a new client' do
    it 'is valid' do
      client = create(:user)
      expect(client).to be_valid
    end
  end
end
