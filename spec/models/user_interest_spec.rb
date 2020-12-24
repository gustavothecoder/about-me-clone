# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserInterest, type: :model do
  let(:user) { create(:user) }
  let(:reason) { create(:reason) }
  let(:interest) { create(:interest) }
  let(:user_interest) { create(:user_interest, user: user, interest: interest) }

  describe 'Relationships' do
    describe 'belongs_to user' do
      it { expect(user_interest.user).to eq(user) }
    end

    describe 'belongs_to interest' do
      it { expect(user_interest.interest).to eq(interest) }
    end
  end
end
