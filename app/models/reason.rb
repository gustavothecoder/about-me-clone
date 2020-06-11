class Reason < ApplicationRecord
  validates :reason, :user_id, presence: true
  belongs_to :user
end
