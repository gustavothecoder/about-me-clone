# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserOccupation, type: :model do
  let(:reason) { create(:reason) }
  let(:user) { create(:user) }
  let(:occupation) { create(:occupation) }
  let(:user_occupation) { create(:user_occupation, user: user, occupation: occupation) }

  describe 'Relationships' do
    describe 'belongs_to user' do
      it { expect(user_occupation.user).to eq(user) }
    end

    describe 'belongs_to occupation' do
      it { expect(user_occupation.occupation).to eq(occupation) }
    end
  end
end
