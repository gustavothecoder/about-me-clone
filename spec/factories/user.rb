# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { '123456' }
    first_name { 'Gustavo' }
    last_name { 'Ribeiro' }
    location { 'Piracicaba' }
    reason_id { Faker::number.number digits: 1 }
  end
end
