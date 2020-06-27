require 'rails_helper'

RSpec.describe UserReason, type: :model do
  before(:all) do
    @reason = Reason.new(reason: 'download my app')
    @reason.save
    @user = User.new(
      username: 'gXh',
      email: 'gustavo@gmail.com',
      password: '123456',
      first_name: 'Gustavo',
      last_name: 'Ribeiro',
      location: 'Piracicaba - SP'
    )
    @user.save
    @user_reason = UserReason.new(user: @user, reason: @reason)
  end

  after(:all) do
    @reason.destroy
    @user.destroy
  end

  it 'Must be a UserReason instance' do
    expect(@user_reason).to be_instance_of(UserReason)
  end

  it 'Must be successfully registered' do
    expect(@user_reason.save).to be true
  end

  context 'Registered data' do
    it 'Must be the registered user' do
      expect(@user_reason.user).to be @user
    end

    it 'Must be the registered reason' do
      expect(@user_reason.reason).to be @reason
    end
  end

  context 'Relationship tests' do
    before(:all) do
      @user_reason.save
      @second_user = User.new(
        username: 'gXhr',
        email: 'gustavoh@gmail.com',
        password: '123456',
        first_name: 'Gustavo',
        last_name: 'Ribeiro',
        location: 'Piracicaba - SP'
      )
      @second_user.save
      @second_user_reason = UserReason.new(user: @second_user, reason: @reason)
      @second_user_reason.save
    end

    after(:all) do
      @second_user.destroy
    end

    it 'There must be a relationship with a user' do
      expect(@reason.users.empty?).to be false
    end

    it 'Must belong to two users' do
      expect(@reason.users.length).to eq 2
    end

    it 'Must be equal to @user' do
      expect(@reason.users[0]).to eq @user
    end

    it 'Must be equal to @second_user' do
      expect(@reason.users[1]).to eq @second_user
    end

    it '#1 There must be a relationship with a reason' do
      expect(@user.reasons.empty?).to be false
    end

    it '#1 Must have an reason' do
      expect(@user.reasons.length).to eq 1
    end

    it '#1 Must be equal to @reason' do
      expect(@user.reasons[0]).to eq @reason
    end

    it '#2 There must be a relationship with a reason' do
      expect(@second_user.reasons.empty?).to be false
    end

    it '#2 Must have an reason' do
      expect(@second_user.reasons.length).to eq 1
    end

    it '#2 Must be equal to @reason' do
      expect(@second_user.reasons[0]).to eq @reason
    end
  end

  context 'Invalid records' do
    it '#1 Must not be registered' do
      third_user_reason = UserReason.new
      expect(third_user_reason.save).to be false
    end
    
    it '#2 Must not be registered' do
      third_user_reason = UserReason.new(user: @user)
      expect(third_user_reason.save).to be false
    end
    
    it '#3 Must not be registered' do
      third_user_reason = UserReason.new(reason: @reason)
      expect(third_user_reason.save).to be false
    end        
  end
end
