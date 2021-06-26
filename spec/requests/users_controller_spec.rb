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
        get '/users/gxh'
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      it 'redirects to the root' do
        get '/users/gxh'
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      get new_user_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST next_signup_step' do
    context 'when an ajax call is made' do
      it 'renders the next_signup_step template' do
        post '/next_signup_step/2', xhr: true
        expect(response).to have_http_status(200)
        expect(response).to render_template(:next_signup_step)
      end
    end

    context 'when a default request is made' do
      it 'rases an error' do
        expect do
          post '/next_signup_step/2'
        end.to raise_error(ActionController::UnknownFormat)
      end
    end
  end

  describe 'POST create' do
    let(:photo_base64) do
      photo = File.binread('public/andre_reboucas.jpg')
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

    context 'when the parameters are correct' do
      it 'creates a user and redirects to your page' do
        post users_path, params: params
        user = User.find_by_email(params[:email])
        expect(user).to_not be_nil
        expect(user.interests.count).to eq(3)
        expect(user.occupations.count).to eq(3)
        expect(user.user_reason).to_not be_nil
        expect(user.user_page_design).to_not be_nil
        expect(response).to redirect_to('http://www.example.com/gxh')
      end
    end

    context 'when the user parameters are not correct' do
      it 'redirects to sign up page with error' do
        params[:email] = 'gxh2@email.com'
        params[:username] = 'gxh2'
        params[:last_name] = nil
        post users_path, params: params
        expect(User.find_by_email('gxh2@email.com')).to be_nil
        expect(response).to redirect_to(new_user_path)
        expect(flash[:alert]).to eq('Your page cannot be created')
      end
    end

    context 'when another parameter are not correct' do
      it 'redirects to sign up page with error' do
        params[:email] = 'gxh2@email.com'
        params[:username] = 'gxh2'
        params[:user_interests] = 'kad,akd,alkdjf'
        post users_path, params: params
        expect(User.find_by_email('gxh2@email.com')).to be_nil
        expect(response).to redirect_to(new_user_path)
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
