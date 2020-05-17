# frozen_string_literal: true

class UserClient < ApplicationRecord
  belongs_to :client
  belongs_to :user
end
