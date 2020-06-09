require 'rails_helper'

RSpec.describe Reason, type: :model do
  before(:all) do
    @reason = Reason.new(reason: 'Download my app')
  end

  after(:all) do
    @reason = nil
  end

  it 'Must be an instance of Reason' do
    expect(@reason).to be_instance_of(Reason)
  end

  it 'Must be successfully registered' do
    expect(@reason.save).to be true
  end

  it 'Must be the registered reason' do
    expect(@reason.reason).to eq 'Download my app'
  end

  it 'Must not be registered' do
    second_reason = Reason.new
    expect(second_reason.save).to be false
  end
end
