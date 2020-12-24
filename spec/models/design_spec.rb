# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Design, type: :model do
  let(:design) { create(:design) }

  context 'When the design_type is filled' do
    it 'Must be valid' do
      expect(design).to be_valid
    end
  end

  context 'When the design_type is not filled' do
    it 'Must not be valid' do
      design.design_type = nil
      design.save
      expect(design).to_not be_valid
    end
  end

  describe 'Relationships' do
    let(:user) { create(:user) }
    let(:reason) { create(:reason) }
    let(:color) { create(:color) }
    let!(:user_page_design) do
      create(:user_page_design, user: user, design: design, color: color)
    end
    let(:second_user) { create(:user) }
    let!(:second_user_page_design) do
      create(:user_page_design, user: second_user, design: design, color: color)
    end

    describe 'has_many user_page_design' do
      it 'Must have two user_page_designs' do
        expect(design.user_page_designs.count).to eq(2)
      end
    end

    describe 'has_many users' do
      it 'Must have two users' do
        expect(design.users.count).to eq(2)
      end
    end
  end
end
