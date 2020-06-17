class User < ApplicationRecord
  validates :username, :email, :password, :first_name, :last_name, :location, presence: true
  validates :username, :email, uniqueness: true
  
  has_one :reason, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :destroy
end
