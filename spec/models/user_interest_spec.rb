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
    @user_interest = UserInterest.new(user: @user, interest: @interest)
  end

  after(:all) do
    @interest.destroy
    @user.destroy
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
  
  context 'Relationship tests' do
    before(:all) do
      @user_interest.save
      @second_user = User.new(
        username: 'gXhr',
        email: 'gustavoh@gmail.com',
        password: '123456',
        first_name: 'Gustavo',
        last_name: 'Ribeiro',
        location: 'Piracicaba - SP'
      )
      @second_user.save
      @second_user_interest = UserInterest.new(user: @second_user, interest: @interest)
      @second_user_interest.save
    end

    after(:all) do
      @second_user.destroy
    end

    it 'Must not be empty - interest' do
      expect(@interest.users.empty?).to be false 
    end
    
    it 'Must belong to two users' do
      expect(@interest.users.length).to eq 2
    end

    it 'Must not be empty - user' do
      expect(@user.interests.empty?).to be false
    end

    it 'Must have an interest' do
      expect(@user.interests.length).to eq 1
    end
  end
  
  context 'Invalid records' do
    it 'Must not be registered #1' do
      third_user_interest = UserInterest.new
      expect(third_user_interest.save).to be false
    end
    
    it 'Must not be registered #2' do
      third_user_interest = UserInterest.new(user_id: @user.id)
      expect(third_user_interest.save).to be false
    end
    
    it 'Must not be registered #3' do
      third_user_interest = UserInterest.new(interest_id: @interest.id)
      expect(third_user_interest.save).to be false
    end
  end
end
