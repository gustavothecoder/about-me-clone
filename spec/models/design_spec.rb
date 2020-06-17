require 'rails_helper'

RSpec.describe Design, type: :model do
  context 'Registering a design' do
    before(:all) do
      @design = Design.new(design_type: 'Small Design')
    end
  
    after(:all) do
      @design.destroy
    end
  
    it 'Must be an instance of Design' do
      expect(@design).to be_instance_of(Design)
    end
  
    it 'Must be successfully registered' do
      expect(@design.save).to be true
    end
  
    it 'Must be registered design' do
      expect(@design.design_type).to eq 'Small Design'
    end
  
    it 'Must not be registered' do
      second_design = Design.new
      expect(second_design.save).to be false
    end
  end
end
