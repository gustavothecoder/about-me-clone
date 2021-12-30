# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Registration::Process, type: :service do
  let(:params) do
    {
      'email' => 'gxh@email.com',
      'first_name' => 'Gustavo',
      'last_name' => 'Ribeiro',
      'location' => 'Brazil',
      'interests' => %w[1 2 3],
      'occupations' => %w[1 2 3],
      'reason' => %w[1],
      'website' => 'website.com',
      'photo_signed_id' => 'blablablablablab',
      'layout' => 1,
      'color' => 1,
      'username' => 'gxh',
      'password' => '123456a',
      'password_confirmation' => '123456a'
    }
  end

  context 'When all parameters are correct and are unique' do
    it 'The service must return true' do
      photo = Rack::Test::UploadedFile.new('spec/fixtures/andre_reboucas.jpg')
      allow(ActiveStorage::Blob).to receive(:find_signed).and_return(photo)

      result = described_class.call(params)

      expect(result).to be(true)
    end

    it 'The user must be created with the data sent' do
      photo = Rack::Test::UploadedFile.new('spec/fixtures/andre_reboucas.jpg')
      allow(ActiveStorage::Blob).to receive(:find_signed).and_return(photo)
      described_class.call(params)

      created_user = User.find_by_email('gxh@email.com')

      expect(created_user).to_not be_nil
      expect(created_user.first_name).to eq(params['first_name'])
      expect(created_user.last_name).to eq(params['last_name'])
      expect(created_user.location).to eq(params['location'])
      expect(created_user.photo.attached?).to be(true)
      expect(created_user.username).to eq(params['username'])
      expect(created_user.password_digest).to_not be_nil
      expect(created_user.interests.first.name).to eq('Photography')
      expect(created_user.interests.second.name).to eq('Technology')
      expect(created_user.interests.third.name).to eq('Design')
      expect(created_user.occupations.first.name).to eq('Student')
      expect(created_user.occupations.second.name).to eq('Web Developer')
      expect(created_user.occupations.third.name).to eq('Software Engineer')
      expect(created_user.user_reason.reason.name).to eq('Attend my event')
      expect(created_user.user_reason.website).to eq('website.com')
      expect(created_user.user_page_design.design).to eq('medium')
      expect(created_user.user_page_design.color).to eq('pink')
    end
  end

  context 'When there is a problem with the user parameters' do
    it 'The user must not be created' do
      params['first_name'] = nil
      photo = Rack::Test::UploadedFile.new('spec/fixtures/andre_reboucas.jpg')
      allow(ActiveStorage::Blob).to receive(:find_signed).and_return(photo)

      result = described_class.call(params)

      expect(result).to be(false)
      expect(User.find_by_email(params['email'])).to be_nil
    end
  end

  context 'When there is a problem with the another parameter' do
    it 'The user must not be created' do
      params['interests'] = %w[3249 392 8934]
      photo = Rack::Test::UploadedFile.new('spec/fixtures/andre_reboucas.jpg')
      allow(ActiveStorage::Blob).to receive(:find_signed).and_return(photo)

      result = described_class.call(params)

      expect(result).to be(false)
      expect(User.find_by_email(params[:email])).to be_nil
    end
  end
end
