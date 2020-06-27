class Occupation < ApplicationRecord
  validates :occupation, presence: true, uniqueness: true
end
