require 'rails_helper'

RSpec.describe Interest, type: :model do
  context 'Registering a interest' do
    before(:all) do
      @interest = create :interest
    end

    after :all do
      @interest.destroy
    end

    it 'Must be an intance of Interest' do
      expect(@interest).to be_instance_of(Interest)
    end

    it 'Must be a successfully registered' do
      expect(@interest.save).to be true
    end

    it 'Must be the registered interest' do
      expect(@interest.interest).to eq 'programming'
    end

    context 'Invalid records' do
      it '#1 Must not be successfully registered' do
        second_interest = Interest.new
        expect(second_interest.save).to be false
      end

      it '#2 Must not be successfully registered' do
        @interest.save
        second_interest = Interest.new(interest: 'programming')
        expect(second_interest.save).to be false
      end
    end
  end
end
