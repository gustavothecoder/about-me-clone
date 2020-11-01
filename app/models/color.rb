# frozen_string_literal: true

class Color < ApplicationRecord
  validates :color, presence: true

  has_many :user_page_design
  has_many :users, through: :user_page_design
end
