# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRecipe, type: :model do
  describe "Relationships" do
    it { should belong_to :user }
    it { should belong_to :recipe }
  end
end
