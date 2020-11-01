# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Color, type: :model do
  let(:color) { create(:color) }

  context 'When the color attribute is filled' do
    it 'Must be valid' do
      expect(color).to be_valid
    end
  end

  context 'When the color attribute is not filled' do
    it 'Must not be valid' do
      color.color = nil
      color.save
      expect(color).to_not be_valid
    end
  end

  describe 'Relationships' do
    let(:reason) { create(:reason) }
    let(:user) { create(:user, reason: reason) }
    let(:design) { create(:design) }
    let!(:user_page_design) do
      create(:user_page_design, user: user, design: design, color: color)
    end
    let(:second_user) { create(:user, reason: reason) }
    let!(:second_user_page_design) do
      create(:user_page_design, user: second_user, design: design, color: color)
    end

    describe 'has many user_page_design' do
      it 'Must have two user_page_designs' do
        expect(color.user_page_design.count).to eq(2)
      end
    end

    describe 'has many users' do
      it 'Must have two users' do
        expect(color.users.count).to eq(2)
      end
    end
  end
end
