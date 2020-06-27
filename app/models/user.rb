class User < ApplicationRecord
  validates :username, :email, :password, :first_name, :last_name, :location, presence: true
  validates :username, :email, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 6, maximum: 15 }
  
  has_one_attached :photo, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :destroy
  has_and_belongs_to_many :reasons, dependent: :destroy
end
