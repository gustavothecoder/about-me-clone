# frozen_string_literal: true

class Color < ApplicationRecord
  validates_presence_of :color

  has_many :user_page_design
  has_many :users, through: :user_page_design
end
