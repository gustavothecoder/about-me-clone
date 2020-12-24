# frozen_string_literal: true

class Reason < ApplicationRecord
  validates :reason, presence: true, uniqueness: true

  has_many :user_reasons
  has_many :users, through: :user_reasons
end
