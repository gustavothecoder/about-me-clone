class UserPageDesign < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :user_id, :design_id, :color_id, presence: true
  
  belongs_to :design
  belongs_to :color
  belongs_to :user
end
