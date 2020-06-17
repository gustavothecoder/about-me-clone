require 'rails_helper'

RSpec.describe Reason, type: :model do
  context 'Registering a reason' do
    before(:all) do
      @user = User.new(
        username: 'gXh',
        email: 'gustavo@gmail.com',
        password: '123456',
        first_name: 'Gustavo',
        last_name: 'Ribeiro',
        location: 'Piracicaba - SP'
      )
      @user.save
      @reason = Reason.new(reason: 'Download my app', user_id: 1)
    end
  
    after(:all) do
      @user.destroy
      @reason.destroy
    end
  
    it 'Must be an instance of Reason' do
      expect(@reason).to be_instance_of(Reason)
    end
  
    it 'Must be successfully registered' do
      expect(@reason.save).to be true
    end
    
    context 'Registered data' do
      it 'Must be the registered reason' do
        expect(@reason.reason).to eq 'Download my app'
      end
  
      it 'Must be the registered user id' do
        expect(@reason.user_id).to eq 1
      end
    end
  
    it 'Must be the registered user' do
      expect(@reason.user).to eq @user
    end
  
    it 'Must not be registered' do
      second_reason = Reason.new(reason: 'Download my app')
      expect(second_reason.save).to be false
    end
  end
end