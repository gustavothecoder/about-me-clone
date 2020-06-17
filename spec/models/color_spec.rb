require 'rails_helper'

RSpec.describe Color, type: :model do
  context 'Registering a color' do
    before(:all) do
      @color = Color.new(color: 'Blue')
    end
  
    after(:all) do
      @color.destroy
    end
  
    it 'Must be a Color instance' do
      expect(@color).to be_instance_of(Color)
    end
  
    it 'Must be successfully registered' do
      expect(@color.save).to be true
    end
  
    it 'Must be registered color' do
      expect(@color.color).to eq 'Blue'
    end
  
    it 'Must not be registered' do
      second_color= Color.new
      expect(second_color.save).to be false
    end
  end
end
