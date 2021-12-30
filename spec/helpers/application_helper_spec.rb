# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  include ApplicationHelper

  describe '#selection_list_of' do
    context 'when the relation is a list of interests' do
      subject(:result) { selection_list_of(Interest.all) }

      it 'should return a HTML with 1 <ul>' do
        expect(
          result.scan('<ul class="w-100 d-flex justify-content-center flex-wrap overflow-auto px-1">').count
        ).to eq(1)
      end

      it { expect(result.scan('</li>').count).to eq(61) }
      it { is_expected.to include(Interest.first.name) }
      it { is_expected.to include(Interest.second.name) }
      it { is_expected.to include(Interest.third.name) }
    end

    context 'when the relation is a list of occupations' do
      subject(:result) { selection_list_of(Occupation.all) }

      it 'should return a HTML with 1 <ul>' do
        expect(
          result.scan('<ul class="w-100 d-flex justify-content-center flex-wrap overflow-auto px-1">').count
        ).to eq(1)
      end

      it { expect(result.scan('</li>').count).to eq(39) }
      it { is_expected.to include(Occupation.first.name) }
      it { is_expected.to include(Occupation.second.name) }
      it { is_expected.to include(Occupation.third.name) }
    end

    context 'when the relation is a list of reasons' do
      subject(:result) { selection_list_of(Reason.all) }

      it 'should return a HTML with 1 <ul>' do
        expect(
          result.scan('<ul class="w-100 d-flex justify-content-center flex-wrap overflow-auto px-1">').count
        ).to eq(1)
      end

      it { expect(result.scan('</li>').count).to eq(29) }
      it { is_expected.to include(Reason.first.name) }
      it { is_expected.to include(Reason.second.name) }
      it { is_expected.to include(Reason.third.name) }
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
