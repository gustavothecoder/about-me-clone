class UserReason < ApplicationRecord
  self.table_name = 'reasons_users'

  belongs_to :user
  belongs_to :reason
end
