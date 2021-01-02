# frozen_string_literal: true

class UserPageDesign < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates_presence_of :design_id

  belongs_to :design
  belongs_to :user

  enum color: %i[blue pink purple orange green dark_gray]
end
