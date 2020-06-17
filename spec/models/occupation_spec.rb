require 'rails_helper'

RSpec.describe Occupation, type: :model do
  context 'Registering an occupation' do
    before(:all) do
      @occupation = Occupation.new(occupation: 'Software Developer')
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
      expect(@occupation.occupation).to eq 'Software Developer'
    end

    it 'Must not be registered' do
      second_occupation = Occupation.new
      expect(second_occupation.save).to be false
    end
  end
end
