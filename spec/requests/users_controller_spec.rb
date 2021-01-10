# frozen_string_literal: true

require 'rails_helper'
require 'base64'

RSpec.describe 'Users', type: :request do
  describe 'GET show' do
    context 'When the user exists' do
      let(:user) { create(:user, username: 'gxh') }
      let!(:user_occupation) { create(:user_occupation, user: user, occupation_id: 1) }
      let!(:user_reason) { create(:user_reason, user: user, reason_id: 1, website: 'example.com') }
      let!(:user_interest) { create(:user_interest, user: user, interest_id: 1) }
      let!(:user_page_design) { create(:user_page_design, user: user, design: 0, color: 0) }

      it 'Must return HTTP status 200' do
        get '/gxh'
        expect(response).to have_http_status(200)
      end
    end

    context 'When the user does not exist' do
      it 'Must redirect to the root' do
        get '/gxh'
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET new' do
    it 'Must render the new template' do
      get '/signup'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
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

    context 'When the parameters are correct' do
      subject! { post users_path, params: params }

      it 'The user and their relationships must be created' do
        user = User.find_by_email(params[:email])
        expect(user).to_not be_nil
        expect(user.interests.count).to eq(3)
        expect(user.occupations.count).to eq(3)
        expect(user.user_reason).to_not be_nil
        expect(user.user_page_design).to_not be_nil
      end

      it 'The user must be redirected to your page' do
        expect(subject).to redirect_to('http://www.example.com/gxh')
      end
    end

    context 'When the user parameters are not correct' do
      subject! do
        params[:email] = 'gxh2@email.com'
        params[:username] = 'gxh2'
        params[:last_name] = nil
        post users_path, params: params
      end

      it 'The user must not be created' do
        expect(User.find_by_email('gxh2@email.com')).to be_nil
      end

      it 'The user must be redirected to the sign up page with message: Your page cannot be created' do
        expect(subject).to redirect_to(signup_path)
        expect(flash[:alert]).to eq('Your page cannot be created')
      end
    end

    context 'When another parameter are not correct' do
      subject! do
        params[:email] = 'gxh2@email.com'
        params[:username] = 'gxh2'
        params[:user_interests] = 'kad,akd,alkdjf'
        post users_path, params: params
      end

      it 'The user must not be created' do
        expect(User.find_by_email('gxh2@email.com')).to be_nil
      end

      it 'The user must be redirected to the sign up page with message: Your page cannot be created' do
        expect(subject).to redirect_to(signup_path)
        expect(flash[:alert]).to eq('Your page cannot be created')
      end
    end
  end

  describe 'POST next_signup_step' do
    context 'When an ajax call is made' do
      it 'Must render the next_signup_step template' do
        post '/next_signup_step/2', xhr: true
        expect(response).to have_http_status(200)
        expect(response).to render_template(:next_signup_step)
      end
    end

    context 'When a default request is made' do
      it 'ActionController::UnknownFormat exception should be thrown' do
        expect { post '/next_signup_step/2' }.to raise_error(ActionController::UnknownFormat)
      end
    end
  end
end
