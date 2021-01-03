# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Create, type: :service do
  let(:photo_base64) do
    photo = File.binread('public/test_active_storage.jpg')
    "data:image;base64,#{Base64.strict_encode64(photo)}"
  end
  let(:params) do
    {
      email: 'gxh@email.com',
      first_name: 'Gustavo',
      last_name: 'Ribeiro',
      location: 'Brazil',
      user_interests: '1,2,3',
      user_occupations: '1,2,3',
      user_reason: '1',
      website: 'website.com',
      photo: photo_base64,
      layout: 1,
      color: 1,
      username: 'gxh',
      password: '123456a',
      password_confirmation: '123456a'
    }
  end
  let!(:result) { Users::Create.call(params) }
  let!(:created_user) { User.find_by_email(params[:email]) }

  context 'When all parameters are correct and are unique' do
    it 'The service must return true' do
      expect(result).to be(true)
    end

    it 'The user must be created with the data sent' do
      expect(created_user).to_not be_nil
      expect(created_user.first_name).to eq(params[:first_name])
      expect(created_user.last_name).to eq(params[:last_name])
      expect(created_user.location).to eq(params[:location])
      expect(created_user.photo.attached?).to be(true)
      expect(created_user.username).to eq(params[:username])
      expect(created_user.password_digest).to_not be_nil
    end

    it 'User interests must be Photography, Technology and Design' do
      expect(created_user.interests.first.interest).to eq('Photography')
      expect(created_user.interests.second.interest).to eq('Technology')
      expect(created_user.interests.third.interest).to eq('Design')
    end

    it 'User occupations must be Student, Web Developer and Software Engineer' do
      expect(created_user.occupations.first.occupation).to eq('Student')
      expect(created_user.occupations.second.occupation).to eq('Web Developer')
      expect(created_user.occupations.third.occupation).to eq('Software Engineer')
    end

    it 'User reason must be Attend my event and the website must be website.com' do
      expect(created_user.reason.reason).to eq('Attend my event')
      expect(created_user.user_reason.website).to eq('website.com')
    end

    it 'The layout must be medium and the color must be pink' do
      expect(created_user.user_page_design.design).to eq('medium')
      expect(created_user.user_page_design.color).to eq('pink')
    end
  end

  context 'When there is a problem with the parameters' do
    it 'The user must not be created' do
      params[:email] = 'gxh2@email.com'
      params[:username] = 'gxh2'
      params[:first_name] = nil
      result = Users::Create.call(params)
      expect(result).to be(false)
      expect(User.find_by_email(params[:email])).to be_nil
    end
  end
end
