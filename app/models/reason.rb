# frozen_string_literal: true

class Reason < ApplicationRecord
  has_many :user_reasons
  has_many :users, through: :user_reasons

  validates :name, presence: true, uniqueness: true
end
