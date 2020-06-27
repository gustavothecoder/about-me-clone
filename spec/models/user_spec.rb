require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Registering a user' do
    before(:all) do
      @user = User.new(
        username: 'gXh',
        email: 'gustavo@gmail.com',
        password: '123456',
        first_name: 'Gustavo',
        last_name: 'Ribeiro',
        location: 'Piracicaba - SP'
      )
    end
  
    after(:all) do
      @user.destroy
    end
  
    it 'Must be a User instance' do
      expect(@user).to be_instance_of(User)
    end
  
    it 'Must be successfully registered' do
      expect(@user.save).to be true
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
        expect(@user.location).to eq 'Piracicaba - SP'
      end
    end
  
    it 'The photo must be saved' do
      @user.photo.attach(io: File.open('app/assets/images/test_active_storage.jpg'), filename: 'test_active_storage.jpg')
      expect(@user.photo.attached?).to be true
    end
    
    it 'The reason must belong to the user' do
      reason = Reason.new(reason: 'Visit my site', user: @user)
      expect(@user.reason).to eq reason
    end
  
    context 'Invalid records' do
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
      end
    
      after(:all) do
        @user.destroy
      end

      it 'Must not be registered #1' do
        second_user = User.new(
          email: 'gustavo@gmail.com',
          password: '123456',
          first_name: 'Gustavo',
          last_name: 'Ribeiro',
          location: 'Piracicaba - SP'
        )
        expect(second_user.save).to be false
      end
  
      it 'Must not be registered #2' do
        second_user = User.new(
          username: 'gXh',
          email: 'gustavo@gmail.com',
          password: '123456',
          first_name: 'Gustavo',
          last_name: 'Ribeiro',
          location: 'Piracicaba - SP'
        )
        expect(second_user.save).to be false
      end

      it 'Must not be registered #3' do
        second_user = User.new(
          username: 'gX',
          email: 'gx@gmail.com',
          password: '123456',
          first_name: 'Gustavo',
          last_name: 'Ribeiro',
          location: 'Piracicaba - SP'
        )
        expect(second_user.save).to be false
      end
      
      it 'Must not be registered #4' do
        second_user = User.new(
          username: 'gXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
          email: 'gx@gmail.com',
          password: '123456',
          first_name: 'Gustavo',
          last_name: 'Ribeiro',
          location: 'Piracicaba - SP'
        )
        expect(second_user.save).to be false
      end
      
      it 'Must not be registered #5' do
        second_user = User.new(
          username: 'gXXXXXXXXXXXXXXXX',
          email: 'gx@gmail.com',
          password: '12345',
          first_name: 'Gustavo',
          last_name: 'Ribeiro',
          location: 'Piracicaba - SP'
        )
        expect(second_user.save).to be false
      end
    
      it 'Must not be registered #6' do
        second_user = User.new(
          username: 'gXXXXXXXXXXXXXXXX',
          email: 'gx@gmail.com',
          password: '12345678910111213',
          first_name: 'Gustavo',
          last_name: 'Ribeiro',
          location: 'Piracicaba - SP'
        )
        expect(second_user.save).to be false
      end
    end
  end
end