# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a new user' do
    it 'is valid' do
      user = create(:user)
      expect(user).to be_valid
    end
  end
end
