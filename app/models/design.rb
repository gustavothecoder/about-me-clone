# frozen_string_literal: true

class Design < ApplicationRecord
  validates_presence_of :design_type

  has_many :user_page_designs
  has_many :users, through: :user_page_designs
end
