# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OccupationsHelper, type: :helper do
  include OccupationsHelper

  describe 'occupation_list' do
    subject { occupation_list }

    it 'should return a HTML with 1 <ul>' do
      expect(
        subject.scan('<ul class="w-100 d-flex justify-content-center flex-wrap overflow-auto px-1">').count
      ).to eq(1)
    end

    it 'should return a HTML with 39 </li>' do
      expect(subject.scan('</li>').count).to eq(39)
    end
  end
end
