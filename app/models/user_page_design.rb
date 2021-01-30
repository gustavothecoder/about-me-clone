# frozen_string_literal: true

class UserPageDesign < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  enum design: %i[small medium big]
  enum color: %i[blue pink purple orange green dark_gray]
end
