# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 3..16) }
    email { Faker::Internet.email }
    password { '123456' }
    first_name { 'Gustavo' }
    last_name { 'Ribeiro' }
    location { 'Piracicaba' }
    reason
    photo { Rack::Test::UploadedFile.new('public/test_active_storage.jpg') }
  end
end
