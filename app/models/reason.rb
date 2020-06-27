class Reason < ApplicationRecord
  validates :reason, presence: true, uniqueness: true

  has_and_belongs_to_many :users
end
