class User < ApplicationRecord
  validates :username, :email, :password, :first_name, :last_name, :location, presence: true
  validates :username, :email, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 6, maximum: 15 }
  
  belongs_to :reason
  has_one :user_page_design
  has_one :design, through: :user_page_design
  has_one :color, through: :user_page_design
  has_one_attached :photo, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :destroy
  has_and_belongs_to_many :occupations, dependent: :destroy
end
