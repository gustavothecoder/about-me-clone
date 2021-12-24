# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  include UsersHelper

  describe '#example_users' do
    it 'returns a UserPresenter for the luis_gama, andre_reboucas and jose_do_patrocinio' do
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

  describe '#registration_step' do
    it { expect(registration_step(step: 0)).to eq('zero') }
    it { expect(registration_step(step: 1)).to eq('one') }
    it { expect(registration_step(step: 2)).to eq('two') }
    it { expect(registration_step(step: 3)).to eq('three') }
    it { expect(registration_step(step: 4)).to eq('four') }
    it { expect(registration_step(step: 5)).to eq('five') }
    it { expect(registration_step(step: 6)).to eq('six') }
    it { expect(registration_step(step: 7)).to eq('seven') }
    it { expect(registration_step(step: 8)).to eq('eight') }
    it { expect(registration_step(step: 9)).to eq('nine') }
    it { expect(registration_step(step: 10)).to eq('ten') }
    it { expect(registration_step(step: 11)).to eq('eleven') }
  end
end
