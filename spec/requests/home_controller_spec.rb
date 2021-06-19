# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :request do
  context 'GET home#index' do
    it 'render the index view' do
      get root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
