require 'rails_helper'

RSpec.describe UserInterest, type: :model do
  before(:all) do
    @interest = Interest.new(interest: 'Download my app')
    @interest.save
    @user = User.new(
      username: 'gXh',
      email: 'gustavo@gmail.com',
      password: '123456',
      first_name: 'Gustavo',
      last_name: 'Ribeiro',
      location: 'Piracicaba - SP'
    )
    @user.save
    @user_interest = UserInterest.new(user_id: @user.id, interest_id: @interest.id)
  end

  after(:all) do
    @interest.destroy
    @user.destroy
    @user_interest.destroy
  end

  it 'Must be a UserInterest instance' do
    expect(@user_interest).to be_instance_of(UserInterest)
  end

  it 'Must be successfully registered' do
    expect(@user_interest.save).to be true
  end

  context 'Registered data' do
    it 'Must be the registered user' do
      expect(@user_interest.user).to eq @user
    end

    it 'Must be the registered interest' do
      expect(@user_interest.interest).to eq @interest
    end
  end

  context 'Invalid records' do
    it 'Must not be registered #1' do
      second_user_interest = UserInterest.new
      expect(second_user_interest.save).to be false
    end
    
    it 'Must not be registered #2' do
      second_user_interest = UserInterest.new(user_id: @user.id)
      expect(second_user_interest.save).to be false
    end
    
    it 'Must not be registered #3' do
      second_user_interest = UserInterest.new(interest_id: @interest.id)
      expect(second_user_interest.save).to be false
    end
  end
end
