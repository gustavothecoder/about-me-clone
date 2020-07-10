# frozen_string_literal: true

class UserInterest < ApplicationRecord
  self.table_name = 'interests_users'

  belongs_to :user
  belongs_to :interest
end
