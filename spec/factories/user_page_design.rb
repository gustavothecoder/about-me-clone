# frozen_string_literal: true

FactoryBot.define do
  factory :user_page_design do
    user
    design
    color
  end
end
