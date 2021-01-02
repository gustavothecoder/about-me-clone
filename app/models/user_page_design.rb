# frozen_string_literal: true

class UserPageDesign < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true

  belongs_to :user

  enum design: %i[small medium big]
  enum color: %i[blue pink purple orange green dark_gray]
end
