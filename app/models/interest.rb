class Interest < ApplicationRecord
  validates :interest, presence: true

  has_and_belongs_to_many :users
end
