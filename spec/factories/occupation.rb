# frozen_string_literal: true

FactoryBot.define do
  factory :occupation do
    name { Faker::Company.profession }
  end
end
