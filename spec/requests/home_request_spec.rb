require 'rails_helper'

RSpec.describe 'Home controller', type: :request do
  context 'GET home#homepage' do
    it 'Must render the homepage view' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:homepage)
    end
  end
end
