# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoungeOwner, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:lounge_owner)).to be_valid
  end

  describe 'validations' do
    let(:lounge_owner) { FactoryBot.build(:lounge_owner) }

    it 'requires a first name' do
      lounge_owner.first_name = nil
      expect(lounge_owner).to be_invalid
    end

    it 'requires a last name' do
      lounge_owner.last_name = nil
      expect(lounge_owner).to be_invalid
    end

    it 'requires a date of birth' do
      lounge_owner.date_of_birth = nil
      expect(lounge_owner).to be_invalid
    end
  end

  describe 'must_be_18_or_older' do
    let(:lounge_owner) { FactoryBot.build(:lounge_owner) }

    it 'requires the date of birth to be 18 years or older' do
      lounge_owner.date_of_birth = 17.years.ago
      expect(lounge_owner).to be_invalid
    end
  end
end
