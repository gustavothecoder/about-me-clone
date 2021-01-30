# frozen_string_literal: true

FactoryBot.define do
  factory :user_reason do
    user
    reason
    website { Faker::Internet.domain_name }
  end
end
