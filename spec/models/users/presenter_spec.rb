# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Presenter, type: :presenter do
  let(:user) { create(:user) }
  let!(:user_occupation) { create(:user_occupation, user: user, occupation_id: 1) }
  let!(:user_occupation2) { create(:user_occupation, user: user, occupation_id: 2) }
  let!(:user_occupation3) { create(:user_occupation, user: user, occupation_id: 3) }
  let!(:user_reason) { create(:user_reason, user: user, reason_id: 1, website: 'example.com') }
  let!(:user_interest) { create(:user_interest, user: user, interest_id: 1) }
  let!(:user_interest2) { create(:user_interest, user: user, interest_id: 2) }
  let!(:user_interest3) { create(:user_interest, user: user, interest_id: 3) }
  let!(:user_page_design) { create(:user_page_design, user: user, design: 0, color: 0) }
  let!(:presenter) { Users::Presenter.new(user) }

  describe 'design' do
    it { expect(presenter.design).to eq(user_page_design.design) }
  end

  describe 'color' do
    it { expect(presenter.color).to eq(user_page_design.color) }
  end

  describe 'full_name' do
    it { expect(presenter.full_name).to eq('Gustavo Ribeiro') }
  end

  describe 'occupations_text' do
    it { expect(presenter.occupations_text).to eq('Student, Web Developer, and Software Engineer in Piracicaba') }
  end

  describe 'interests_text' do
    it { expect(presenter.interests_text).to eq('#photography #technology #design') }
  end

  describe 'reason' do
    it { expect(presenter.reason).to eq('Attend my event') }
  end

  describe 'website' do
    it { expect(presenter.website).to eq('https://example.com') }
  end

  describe 'summary' do
    subject { presenter.summary }

    it { is_expected.to include(user.first_name) }
    it { is_expected.to include(Occupation.find(1).name) }
    it { is_expected.to include(user.location) }
    it { is_expected.to include(Interest.find(1).name) }
    it { is_expected.to include(Interest.find(2).name) }
    it { is_expected.to include(Interest.find(3).name) }
    it { is_expected.to include(user.user_reason.reason.name) }
  end
end
