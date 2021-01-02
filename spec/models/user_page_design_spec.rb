# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPageDesign, type: :model do
  let(:reason) { create(:reason) }
  let(:user) { create(:user) }
  let(:user_page_design) { create(:user_page_design, user: user, design: :small, color: :blue) }

  context 'When all parameters are filled' do
    it 'Must be valid' do
      expect(user_page_design).to be_valid
    end
  end

  context 'When user is not filled' do
    it 'Must not be valid' do
      invalid_user_page_design = build(:user_page_design, user: nil)
      expect(invalid_user_page_design).to_not be_valid
    end
  end

  describe 'Relationships' do
    describe 'belongs_to user' do
      it { expect(user_page_design.user).to eq(user) }
    end
  end
end
