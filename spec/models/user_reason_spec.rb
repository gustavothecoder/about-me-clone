# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserReason, type: :model do
  let(:user) { create(:user) }
  let(:reason) { create(:reason) }
  let(:user_reason) { create(:user_reason, user: user, reason: reason) }

  describe 'Relationships' do
    describe 'belongs_to :user' do
      it { expect(user_reason.user).to eq(user) }
    end

    describe 'belongs_to :reason' do
      it { expect(user_reason.reason).to eq(reason) }
    end
  end

  describe 'Invalid records' do
    context 'When the user is nil' do
      it 'Must not be valid' do
        invalid_user_reason = build(:user_reason, user: nil)
        expect(invalid_user_reason).to_not be_valid
      end
    end

    context 'When the reason is nil' do
      it 'Must not be valid' do
        invalid_user_reason = build(:user_reason, reason: nil)
        expect(invalid_user_reason).to_not be_valid
      end
    end
  end
end
