# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one_attached :photo, dependent: :destroy

  validates_presence_of :username, :email, :password, :first_name, :last_name, :location
  validates_uniqueness_of :username, :email
  validates :username, length: { minimum: 3, maximum: 18 }
  validates :password, length: { minimum: 6, maximum: 18 }

  before_save { self.username = username.strip if username.present? }
  before_save { self.email = email.strip.downcase if email.present? }
  before_save { self.password = password.strip if password.present? }

  has_and_belongs_to_many :interests, dependent: :destroy
  has_and_belongs_to_many :occupations, dependent: :destroy
  has_one :user_reason
  has_one :reason, through: :user_reason
  has_one :user_page_design
end
