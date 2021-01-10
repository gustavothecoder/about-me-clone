# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Occupation, type: :model do
  let!(:occupation) { create(:occupation, occupation: 'software developer') }

  context 'When the occupation is filled' do
    it 'Must be valid' do
      expect(occupation).to be_valid
    end
  end

  context 'When the occupation is not filled' do
    it 'Must not be valid' do
      invalid_occupation = Occupation.new(occupation: nil)
      expect(invalid_occupation).to_not be_valid
    end
  end

  context 'When the occupation has already been registered' do
    it 'Must not be valid' do
      invalid_occupation = Occupation.new(occupation: 'software developer')
      expect(invalid_occupation).to_not be_valid
    end
  end

  describe 'Relationships' do
    describe 'has_and_belongs_to_many users' do
      let(:user) { create(:user) }
      let(:reason) { create(:reason) }
      let!(:user_occupation) { create(:user_occupation, user: user, occupation: occupation) }
      let(:second_user) { create(:user) }
      let!(:second_user_occupation) { create(:user_occupation, user: user, occupation: occupation) }

      it 'Must have two users' do
        expect(occupation.users.count).to eq(2)
      end
    end
  end
end
