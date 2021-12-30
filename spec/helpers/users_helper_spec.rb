# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  include UsersHelper

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
