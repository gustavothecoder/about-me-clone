require 'rails_helper'

RSpec.describe Occupation, type: :model do
  context 'Registering an occupation' do
    before(:all) do
      @occupation = Occupation.new(occupation: 'software developer')
    end

    after(:all) do
      @occupation.destroy
    end

    it 'Must be an instance of Occupation' do
      expect(@occupation).to be_instance_of(Occupation)
    end

    it 'Must be successfully registered' do
      expect(@occupation.save).to be true
    end

    it 'Must be registered occupation' do
      expect(@occupation.occupation).to eq 'software developer'
    end

    context 'Invalid records' do
      it '#1 Must not be registered' do
        second_occupation = Occupation.new
        expect(second_occupation.save).to be false
      end

      it '#2 Must not be registered' do
        @occupation.save
        second_occupation = Occupation.new(occupation: 'software developer')
        expect(second_occupation.save).to be false
      end
    end
  end
end
