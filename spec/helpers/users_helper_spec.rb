# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  include UsersHelper

  describe 'example_users' do
    it 'should return a UserPresenter for the luis_gama, andre_reboucas and jose_do_patrocinio' do
      create(:user)
      create(:user, first_name: 'Luís', last_name: 'Gama', username: 'luis_gama')
      create(:user, first_name: 'André', last_name: 'Rebouças', username: 'andre_reboucas')
      create(:user, first_name: 'José', last_name: 'do Patrocínio', username: 'jose_do_patrocinio')
      result = example_users
      expect(result.count).to eq(3)
      expect(result.first.full_name).to eq('Luís Gama')
      expect(result.second.full_name).to eq('André Rebouças')
      expect(result.third.full_name).to eq('José Do patrocínio')
    end
  end
end
