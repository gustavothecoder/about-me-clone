# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reason, type: :model do
  let!(:reason) { create(:reason) }

  context 'When the reason is filled' do
    it 'Must be valid' do
      expect(reason).to be_valid
    end
  end

  context 'When the reason is not filled' do
    it 'Must not be valid' do
      invalid_reason = Reason.new(reason: nil)
      expect(invalid_reason).to_not be_valid
    end
  end

  context 'When the reason has already been registered' do
    it 'Must not be valid' do
      invalid_reason = Reason.new(reason: 'download my app')
      expect(invalid_reason).to_not be_valid
    end
  end

  describe 'Relationships' do
    let(:reason) { create(:reason) }
    let(:user) { create(:user) }
    let!(:user_reason) { create(:user_reason, user: user, reason: reason) }
    let(:second_user) { create(:user) }
    let!(:other_user_reason) { create(:user_reason, user: second_user, reason: reason) }

    describe 'has_many :user_reasons' do
      it { expect(reason.user_reasons.count).to eq(2) }
    end

    describe 'has_many users' do
      it { expect(reason.users.count).to eq(2) }
    end
  end
end
