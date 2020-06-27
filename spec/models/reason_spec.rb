require 'rails_helper'

RSpec.describe Reason, type: :model do
  context 'Registering a reason' do
    before(:all) do
      @reason = Reason.new(reason: 'download my app')
    end
  
    after(:all) do
      @reason.destroy
    end
  
    it 'Must be an instance of Reason' do
      expect(@reason).to be_instance_of(Reason)
    end
  
    it 'Must be successfully registered' do
      expect(@reason.save).to be true
    end
    
    context 'Registered data' do
      it 'Must be the registered reason' do
        expect(@reason.reason).to eq 'download my app'
      end
    end
  
    context 'Invalid records' do
      it '#1 Must not be registered' do
        second_reason = Reason.new
        expect(second_reason.save).to be false
      end

      it '#2 Must not be registered' do
        @reason.save
        second_reason = Reason.new(reason: 'download my app')
        expect(second_reason.save).to be false
      end
    end
  end
end