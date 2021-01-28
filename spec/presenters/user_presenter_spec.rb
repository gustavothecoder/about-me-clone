# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPresenter, type: :presenter do
  let(:user) { create(:user) }
  let!(:user_occupation) { create(:user_occupation, user: user, occupation_id: 1) }
  let!(:user_occupation2) { create(:user_occupation, user: user, occupation_id: 2) }
  let!(:user_occupation3) { create(:user_occupation, user: user, occupation_id: 3) }
  let!(:user_reason) { create(:user_reason, user: user, reason_id: 1, website: 'example.com') }
  let!(:user_interest) { create(:user_interest, user: user, interest_id: 1) }
  let!(:user_interest2) { create(:user_interest, user: user, interest_id: 2) }
  let!(:user_interest3) { create(:user_interest, user: user, interest_id: 3) }
  let!(:presenter) { UserPresenter.new(user) }

  describe 'full_name' do
    it 'Must return Gustavo Ribeiro' do
      expect(presenter.full_name).to eq('Gustavo Ribeiro')
    end
  end

  describe 'occupations_text' do
    it 'Must return Student, Web Developer, and Software Engineer in Piracicaba' do
      expect(presenter.occupations_text).to eq('Student, Web Developer, and Software Engineer in Piracicaba')
    end
  end

  describe 'reason' do
    it 'Must return Attend my event' do
      expect(presenter.reason).to eq('Attend my event')
    end
  end

  describe 'website' do
    it 'Must return example' do
      expect(presenter.website).to eq('example.com')
    end
  end

  describe 'summary' do
    subject { presenter.summary }

    it { is_expected.to include(user.first_name) }
    it { is_expected.to include(Occupation.find(1).name) }
    it { is_expected.to include(user.location) }
    it { is_expected.to include(Interest.find(1).name) }
    it { is_expected.to include(Interest.find(2).name) }
    it { is_expected.to include(Interest.find(3).name) }
    it { is_expected.to include(user.user_reason.reason.reason) }
  end
end
