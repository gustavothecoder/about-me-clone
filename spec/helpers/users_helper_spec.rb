# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  include UsersHelper

  let(:user) { create(:user) }
  let!(:user_occupation) { create(:user_occupation, user: user, occupation_id: 1) }
  let!(:user_occupation2) { create(:user_occupation, user: user, occupation_id: 2) }
  let!(:user_occupation3) { create(:user_occupation, user: user, occupation_id: 3) }
  let!(:user_reason) { create(:user_reason, user: user, reason_id: 1, website: 'example.com') }
  let!(:user_interest) { create(:user_interest, user: user, interest_id: 1) }
  let!(:user_interest2) { create(:user_interest, user: user, interest_id: 2) }
  let!(:user_interest3) { create(:user_interest, user: user, interest_id: 3) }

  describe 'full_name' do
    it 'Must return Gustavo Ribeiro' do
      expect(full_name(user)).to eq('Gustavo Ribeiro')
    end
  end

  describe 'occupations_text' do
    it 'Must return Student, Web Developer, and Software Engineer in Piracicaba' do
      expect(occupations_text(user)).to eq('Student, Web Developer, and Software Engineer in Piracicaba')
    end
  end

  describe 'get_user_reason' do
    it 'Must return Attend my event' do
      expect(get_user_reason(user)).to eq('Attend my event')
    end
  end

  describe 'user_website' do
    it 'Must return example' do
      expect(user_website(user)).to eq('example.com')
    end
  end

  describe 'user_summary' do
    subject { user_summary(user) }

    it { is_expected.to include(user.first_name) }
    it { is_expected.to include(Occupation.find(1).occupation) }
    it { is_expected.to include(user.location) }
    it { is_expected.to include(Interest.find(1).interest) }
    it { is_expected.to include(Interest.find(2).interest) }
    it { is_expected.to include(Interest.find(3).interest) }
    it { is_expected.to include(user.user_reason.reason.reason) }
  end
end
