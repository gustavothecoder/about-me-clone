# frozen_string_literal: true

FactoryBot.define do
  factory :user_page_design do
    user { build(:user) }
    design { build(:design) }
    color { [*0..5].sample }
  end
end
