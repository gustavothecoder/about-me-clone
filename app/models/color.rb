# frozen_string_literal: true

class Color < ApplicationRecord
  validates_presence_of :color

  has_many :user_page_designs
  has_many :users, through: :user_page_designs
end
