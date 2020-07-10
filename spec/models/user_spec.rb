# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Registering a user' do
    before :all do
      @reason = create :reason
      @user = create :user, username: 'gXh', email: 'gustavo@gmail.com', reason_id: @reason.id
    end

    after :all do
      @user.destroy
      @reason.destroy
    end

    it 'Must be a User instance' do
      expect(@user).to be_instance_of(User)
    end

    context 'Registered data' do
      it 'Must be the registered username ' do
        expect(@user.username).to eq 'gXh'
      end

      it 'Must be the registered email' do
        expect(@user.email).to eq 'gustavo@gmail.com'
      end

      it 'Must be the registered password' do
        expect(@user.password).to eq '123456'
      end

      it 'Must be the registered first name' do
        expect(@user.first_name).to eq 'Gustavo'
      end

      it 'Must be the last registered name' do
        expect(@user.last_name).to eq 'Ribeiro'
      end

      it 'Must be the registered location' do
        expect(@user.location).to eq 'Piracicaba'
      end

      it 'Must be the registered reason id' do
        expect(@user.reason_id).to eq @reason.id
      end
    end

    it 'The photo must be saved' do
      @user.photo.attach(io: File.open('app/assets/images/test_active_storage.jpg'), filename: 'test_active_storage.jpg')
      expect(@user.photo.attached?).to be true
    end

    context 'Relationship tests' do
      it 'There must be a relationship with a reason' do
        expect(@user.reason).to eq @reason
      end
    end

    context 'Invalid records' do
      it 'Must not be registered #1' do
        second_user = build :user, username: nil, reason_id: @reason.id
        expect(second_user.save).to be false
      end

      it 'Must not be registered #2' do
        second_user = build :user, username: 'gXh', email: 'gustavo@gmail.com', reason_id: @reason.id
        expect(second_user.save).to be false
      end

      it 'Must not be registered #3' do
        second_user = build :user, username: 'gX', reason_id: @reason.id
        expect(second_user.save).to be false
      end

      it 'Must not be registered #4' do
        second_user = build :user, username: 'gXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', reason_id: @reason.id
        expect(second_user.save).to be false
      end

      it 'Must not be registered #5' do
        second_user = build :user, password: '12345', reason_id: @reason.id
        expect(second_user.save).to be false
      end

      it 'Must not be registered #6' do
        second_user = build :user, password: '12345678910111213', reason_id: @reason.id
        expect(second_user.save).to be false
      end
    end
  end
end
