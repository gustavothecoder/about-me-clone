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
end
