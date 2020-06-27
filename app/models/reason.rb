class Reason < ApplicationRecord
  validates :reason, presence: true, uniqueness: true

  has_many :users
end
