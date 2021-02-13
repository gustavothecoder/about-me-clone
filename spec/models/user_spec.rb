# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    create(:user, username: '  gXh', email: 'GXH@email.com  ', password: '  123456a  ')
  end

  describe 'data' do
    it { expect(user.username).to eq('gXh') }

    it { expect(user.email).to eq('gxh@email.com') }

    it { expect(user.password).to eq('123456a') }
  end

  describe 'associations' do
    describe 'has_one_attached :photo' do
      it { expect(user.photo.attached?).to be(true) }
    end

    describe 'has_one :user_page_design' do
      it 'should have a UserPageDesign' do
        create(:user_page_design, user: user)
        expect(user.user_page_design).to be_instance_of(UserPageDesign)
      end
    end

    describe 'has_one :user_reason' do
      it 'should have a UserReason' do
        create(:user_reason, user: user, reason_id: 1)
        expect(user.user_reason).to be_instance_of(UserReason)
      end
    end

    describe 'has_and_belongs_to_many :interests' do
      it 'should have two interests' do
        create(:user_interest, user: user, interest_id: 1)
        create(:user_interest, user: user, interest_id: 2)
        expect(user.interests.count).to eq(2)
      end
    end

    describe 'has_and_belongs_to_many :occupations' do
      it 'should have two occupations' do
        create(:user_occupation, user: user, occupation_id: 1)
        create(:user_occupation, user: user, occupation_id: 2)
        expect(user.occupations.count).to eq(2)
      end
    end
  end

  describe 'validations' do
    context 'when all parameters are correctly filled' do
      it { expect(user).to be_valid }
    end

    context 'when username is not filled' do
      it 'should not be valid' do
        invalid_user = build(:user, username: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when email is not filled' do
      it 'should not be valid' do
        invalid_user = build(:user, email: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when password is not filled' do
      it 'should not be valid' do
        invalid_user = build(:user, password: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when first_name is not filled' do
      it 'should not be valid' do
        invalid_user = build(:user, first_name: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when last_name is not filled' do
      it 'should not be valid' do
        invalid_user = build(:user, last_name: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when location is not filled' do
      it 'should not be valid' do
        invalid_user = build(:user, location: nil)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when the username is already being used' do
      it 'should not be valid' do
        invalid_user = build(:user, username: user.username)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when the email is already being used' do
      it 'should not be valid' do
        invalid_user = build(:user, email: user.email)
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when the username less than 3 characters' do
      it 'should not be valid' do
        invalid_user = build(:user, username: 'gx')
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when the username is longer than 18 characters' do
      it 'should not be valid' do
        invalid_user = build(:user, username: 'gxxxxxxxxxxxxxxxxxxh')
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when the password less than 6 characters' do
      it 'should not be valid' do
        invalid_user = build(:user, password: '12345')
        expect(invalid_user).to_not be_valid
      end
    end

    context 'when the password is longer than 18 characters' do
      it 'should not be valid' do
        invalid_user = build(:user, password: '12345678910111213131')
        expect(invalid_user).to_not be_valid
      end
    end
  end
end
