class Occupation < ApplicationRecord
  validates :occupation, presence: true, uniqueness: true

  has_and_belongs_to_many :users
end
