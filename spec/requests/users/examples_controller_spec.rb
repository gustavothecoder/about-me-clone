# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::ExamplesController, type: :request do
  describe 'GET examples' do
    it 'should render the examples template' do
      get users_examples_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
