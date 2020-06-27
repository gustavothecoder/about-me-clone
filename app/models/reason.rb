class Reason < ApplicationRecord
  validates :reason, presence: true, uniqueness: true
end
