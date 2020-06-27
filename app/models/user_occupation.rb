class UserOccupation < ApplicationRecord
  self.table_name = 'occupations_users'
  
  belongs_to :user
  belongs_to :occupation
end
