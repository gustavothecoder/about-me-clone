# frozen_string_literal: true

class Design < ApplicationRecord
  validates :design_type, presence: true

  has_one :user_page_design
  has_many :users, through: :user_page_design
end
