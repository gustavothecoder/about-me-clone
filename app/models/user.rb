class User < ApplicationRecord
  validates :username, :email, :password, :first_name, :last_name, :location, presence: true
  has_one :reason
  has_one_attached :photo
end
