# frozen_string_literal: true

class UserReason < ApplicationRecord
  belongs_to :user
  belongs_to :reason
end
