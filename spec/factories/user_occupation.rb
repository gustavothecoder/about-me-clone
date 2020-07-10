# frozen_string_literal: true

FactoryBot.define do
  factory :user_occupation do
    user
    occupation
  end
end
