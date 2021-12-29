# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET show' do
    context 'when the user exists' do
      it 'returns HTTP status 200' do
        user = create(:user, username: 'gxh')
        create(:user_occupation, user: user, occupation_id: 1)
        create(:user_reason, user: user, reason_id: 1, website: 'example.com')
        create(:user_interest, user: user, interest_id: 1)
        create(:user_page_design, user: user, design: 0, color: 0)
        get '/gxh'
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      it 'redirects to the root' do
        get '/gxh'
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST create' do
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
        'layout' => '1',
        'color' => '1',
        'username' => 'gxh',
        'password' => '123456a',
        'password_confirmation' => '123456a'
      }
    end

    context 'when the parameters are correct' do
      it 'creates a user and redirects to your page' do
        photo = Rack::Test::UploadedFile.new('public/andre_reboucas.jpg')
        allow(ActiveStorage::Blob).to receive(:find_signed).and_return(photo)
        allow_any_instance_of(
          ActionDispatch::Request::Session
        ).to receive(:[]).with(any_args)
        allow_any_instance_of(
          ActionDispatch::Request::Session
        ).to receive(:[]).with(:registration_params).and_return(params)

        post users_path
        user = User.find_by_email(params['email'])

        expect(user).to_not be_nil
        expect(response).to redirect_to('http://www.example.com/gxh')
      end
    end

    context 'when the user parameters are not correct' do
      it 'redirects to sign up page with error' do
        params['last_name'] = nil
        photo = Rack::Test::UploadedFile.new('public/andre_reboucas.jpg')
        allow(ActiveStorage::Blob).to receive(:find_signed).and_return(photo)
        allow_any_instance_of(
          ActionDispatch::Request::Session
        ).to receive(:[]).with(any_args)
        allow_any_instance_of(
          ActionDispatch::Request::Session
        ).to receive(:[]).with(:registration_params).and_return(params)

        post users_path

        expect(User.find_by_email(params['email'])).to be_nil
        expect(response).to redirect_to(users_registrations_path)
        expect(flash[:alert]).to eq('Your page cannot be created')
      end
    end
  end

  describe 'GET examples' do
    it 'should render the examples template' do
      get examples_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:examples)
    end
  end
end
