# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reason, type: :model do
  context 'Registering a reason' do
    before :all do
      @reason = build :reason
    end

    after :all do
      @reason.destroy
    end

    it 'Must be an instance of Reason' do
      expect(@reason).to be_instance_of Reason
    end

    it 'Must be successfully registered' do
      expect(@reason.save).to be true
    end

    context 'Registered data' do
      it 'Must be the registered reason' do
        expect(@reason.reason).to eq 'download my app'
      end
    end

    context 'Relationship tests' do
      before(:all) do
        @reason.save
        @user = create :user, reason_id: @reason.id
        @second_user = create :user, reason_id: @reason.id
      end

      after(:all) do
        @user.destroy
        @second_user.destroy
      end

      it 'There must be a relationship with a user' do
        expect(@reason.users.empty?).to be false
      end

      it 'Must belog to two users' do
        expect(@reason.users.length).to eq 2
      end

      it 'Must be equal to @user' do
        expect(@reason.users[0]).to eq @user
      end

      it 'Must be equal to @second_user' do
        expect(@reason.users[1]).to eq @second_user
      end
    end

    context 'Invalid records' do
      it '#1 Must not be registered' do
        second_reason = Reason.new
        expect(second_reason.save).to be false
      end

      it '#2 Must not be registered' do
        @reason.save
        second_reason = Reason.new(reason: 'download my app')
        expect(second_reason.save).to be false
      end
    end
  end
end
