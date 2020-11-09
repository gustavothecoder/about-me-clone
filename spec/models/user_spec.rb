# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:reason) { create(:reason) }
  let(:user) { create(:user, reason: reason) }

  describe 'Registered data' do
    it 'Must have a photo attached' do
      expect(user.photo.attached?).to be(true)
    end
  end

  describe 'Validations' do
    context 'When all parameters are correctly filled' do
      it 'Must be valid' do
        expect(user).to be_valid
      end
    end

    context 'When username is not filled' do
      it 'Must not be valid' do
        invalid_user = build(:user, username: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When email is not filled' do
      it 'Must not be valid' do
        invalid_user = build(:user, email: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When password is not filled' do
      it 'Must not be valid' do
        invalid_user = build(:user, password: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When first_name is not filled' do
      it 'Must not be valid' do
        invalid_user = build(:user, first_name: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When last_name is not filled' do
      it 'Must not be valid' do
        invalid_user = build(:user, last_name: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When location is not filled' do
      it 'Must not be valid' do
        invalid_user = build(:user, location: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When the username is already being used' do
      it 'Must not be valid' do
        invalid_user = build(:user, username: user.username)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When the email is already being used' do
      it 'Must not be valid' do
        invalid_user = build(:user, email: user.email)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When the username less than 3 characters' do
      it 'Must not be valid' do
        invalid_user = build(:user, username: 'gx')
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When the username is longer than 16 characters' do
      it 'Must not be valid' do
        invalid_user = build(:user, username: 'gxxxxxxxxxxxxxxxh')
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When the password less than 6 characters' do
      it 'Must not be valid' do
        invalid_user = build(:user, password: '12345')
        expect(invalid_user).to_not be_valid
      end
    end

    context 'When the password is longer than 16 characters' do
      it 'Must not be valid' do
        invalid_user = build(:user, password: '12345678910111213')
        expect(invalid_user).to_not be_valid
      end
    end
  end

  describe 'Relationships' do
    let(:design) { create(:design) }
    let(:color) { create(:color) }
    let!(:user_page_design) { create(:user_page_design, user: user, design: design, color: color) }

    describe 'belongs_to reason' do
      it { expect(user.reason).to_not be_nil }
    end

    describe 'has_one user_page_design' do
      it { expect(user.user_page_design).to_not be_nil }
    end

    describe 'has_one design' do
      it { expect(user.design).to_not be_nil }
    end

    describe 'has_one color' do
      it { expect(user.color).to_not be_nil }
    end

    describe 'has_and_belongs_to_many interests' do
      let(:first_interest) { create(:interest) }
      let(:second_interest) { create(:interest, interest: 'games') }
      let!(:first_user_interest) { create(:user_interest, user: user, interest: first_interest) }
      let!(:second_user_interest) { create(:user_interest, user: user, interest: second_interest) }

      it 'Must have two interests' do
        expect(user.interests.count).to eq(2)
      end
    end

    describe 'has_and_belongs_to_many occupations' do
      let(:first_occupation) { create(:occupation) }
      let(:second_occupation) { create(:occupation, occupation: 'dev') }
      let!(:first_user_occupation) { create(:user_occupation, user: user, occupation: first_occupation) }
      let!(:second_user_occupation) { create(:user_occupation, user: user, occupation: second_occupation) }

      it 'Must have two occupations' do
        expect(user.occupations.count).to eq(2)
      end
    end
  end
end
