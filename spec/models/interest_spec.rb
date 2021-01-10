# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interest, type: :model do
  let!(:interest) { create(:interest) }

  context 'When the interest is filled' do
    it 'Must be valid' do
      expect(interest).to be_valid
    end
  end

  context 'When the interest is not filled' do
    it 'Must not be valid' do
      invalid_interest = Interest.new(name: nil)
      expect(invalid_interest).to_not be_valid
    end
  end

  context 'When the interest has already been registered' do
    it 'Must not be valid' do
      invalid_interest = Interest.new(name: 'programming')
      expect(invalid_interest).to_not be_valid
    end
  end

  describe 'Relationships' do
    describe 'has_and_belongs_to_many users' do
      let(:user) { create(:user) }
      let(:reason) { create(:reason) }
      let!(:user_interest) { create(:user_interest, user: user, interest: interest) }
      let(:second_user) { create(:user) }
      let!(:second_user_interest) { create(:user_interest, user: user, interest: interest) }

      it 'Must have two users' do
        expect(interest.users.count).to eq(2)
      end
    end
  end
end
