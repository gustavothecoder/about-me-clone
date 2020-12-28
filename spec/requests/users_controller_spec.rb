# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET new' do
    it 'Must render the new template' do
      get '/signup'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
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
