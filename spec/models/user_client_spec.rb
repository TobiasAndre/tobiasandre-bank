# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserClient, type: :model do
  context 'when creating a relation between user and client' do
    it 'is valid' do
      user_client = create(:user_client)
      expect(user_client).to be_valid
    end
  end
end
