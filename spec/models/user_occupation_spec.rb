require 'rails_helper'

RSpec.describe UserOccupation, type: :model do
  before(:all) do
    @occupation = Occupation.new(occupation: 'software developer')
    @occupation.save
    @reason = Reason.new(reason: 'download my app')
    @reason.save
    @user = User.new(
      username: 'gXh',
      email: 'gustavo@gmail.com',
      password: '123456',
      first_name: 'Gustavo',
      last_name: 'Ribeiro',
      location: 'Piracicaba - SP',
      reason_id: @reason.id
    )
    @user.save
    @user_occupation = UserOccupation.new(user: @user, occupation: @occupation)
  end

  after(:all) do
    @occupation.destroy
    @user.destroy
    @reason.destroy
  end

  it 'Must be a UserOccupation instance' do
    expect(@user_occupation).to be_instance_of(UserOccupation)
  end

  it 'Must be successfully registered' do
    expect(@user_occupation.save).to be true
  end

  context 'Registered data' do
    it 'Must be the registered user' do
      expect(@user_occupation.user).to eq @user
    end

    it 'Must be the registered occupation' do
      expect(@user_occupation.occupation).to eq @occupation
    end
  end

  context 'Relationship tests' do
    before(:all) do
      @user_occupation.save
      @second_user = User.new(
        username: 'gXhr',
        email: 'gustavoh@gmail.com',
        password: '123456',
        first_name: 'Gustavo',
        last_name: 'Ribeiro',
        location: 'Piracicaba - SP',
        reason_id: @reason.id
      )
      @second_user.save
      @second_user_occupation = UserOccupation.new(user: @second_user, occupation: @occupation)
      @second_user_occupation.save
    end

    after(:all) do
      @second_user.destroy
    end

    it 'There must be a relationship with a user' do
      expect(@occupation.users.empty?).to be false
    end

    it 'Must belongs to two users' do
      expect(@occupation.users.length).to eq 2
    end

    it 'Must be equal to @user' do
      expect(@occupation.users[0]).to eq @user
    end

    it 'Must be equal to @second_user' do
      expect(@occupation.users[1]).to eq @second_user
    end

    it '#1 There must be a relationship with a occupation' do
      expect(@user.occupations.empty?).to be false
    end

    it '#1 Must have an occupation' do
      expect(@user.occupations.length).to eq 1
    end

    it '#1 Must be equal to @occupation' do
      expect(@user.occupations[0]).to eq @occupation
    end
    
    it '#2 There must be a relationship with a occupation' do
      expect(@second_user.occupations.empty?).to be false
    end

    it '#2 Must have an occupation' do
      expect(@second_user.occupations.length).to eq 1
    end

    it '#2 Must be equal to @occupation' do
      expect(@second_user.occupations[0]).to eq @occupation
    end
  end

  context 'Invalid records' do
    it 'Must not be registered #1' do
      third_user_occupation = UserOccupation.new
      expect(third_user_occupation.save).to be false
    end
    
    it 'Must not be registered #2' do
      third_user_occupation = UserOccupation.new(user: @user)
      expect(third_user_occupation.save).to be false
    end
    
    it 'Must not be registered #3' do
      third_user_occupation = UserOccupation.new(occupation: @occupation)
      expect(third_user_occupation.save).to be false
    end
  end
end
