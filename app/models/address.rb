# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user, dependent: :destroy

  def self.countries
    [
      "US",
      "CA",
    ]
  end

  def self.currencies
    [
      "USD",
      "CAD",
    ]
  end
end