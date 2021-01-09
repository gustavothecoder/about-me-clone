# frozen_string_literal: true

FactoryBot.define do
  factory :occupation do
    occupation { Faker::Company.profession }
  end
end
