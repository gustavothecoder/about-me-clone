# frozen_string_literal: true

class UserPageDesign < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates_presence_of :design_id, :color_id

  belongs_to :design
  belongs_to :color
  belongs_to :user
end
