require 'rails_helper'

RSpec.describe "Homes", type: :request do
  context 'GET home#homepage' do
    it 'Must have http 200 status' do
      get '/'
      expect(response).to have_http_status(:ok)
    end

    it 'Must render the homepage view' do
      get '/'
      expect(response).to render_template(:homepage)
    end
  end
end
