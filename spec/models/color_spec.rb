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

    describe 'has one user_page_design' do
      it 'Must have a user_page_design' do
        expect(color.user_page_design).to_not be_nil
      end
    end

    describe 'has many users' do
      let(:second_user) { create(:user, reason: reason) }
      let!(:second_user_page_design) do
        create(:user_page_design, user: second_user, design: design, color: color)
      end

      it 'Must have two users' do
        expect(color.users.count).to eq(2)
      end
    end
  end
end
