# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InterestsHelper, type: :helper do
  include InterestsHelper

  describe 'interest_list' do
    subject { interest_list }

    it 'should return a HTML with 1 <ul>' do
      expect(
        subject.scan('<ul class="w-100 d-flex justify-content-center flex-wrap overflow-auto px-1">').count
      ).to eq(1)
    end

    it 'should return a HTML with 61 </li>' do
      expect(subject.scan('</li>').count).to eq(61)
    end
  end
end
