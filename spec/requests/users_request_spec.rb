# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET new' do
    it 'Must have http status 200' do
      get '/users/new'
      expect(response).to have_http_status 200
    end

    it 'Must render new template' do
      get '/users/new'
      expect(response).to render_template :new
    end
  end
end
