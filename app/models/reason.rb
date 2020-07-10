# frozen_string_literal: true

class Reason < ApplicationRecord
  validates :reason, presence: true, uniqueness: true

  has_many :users
end
