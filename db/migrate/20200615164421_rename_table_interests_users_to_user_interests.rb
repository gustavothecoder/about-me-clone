class RenameTableInterestsUsersToUserInterests < ActiveRecord::Migration[6.0]
  def change
    rename_table :interests_users, :user_interests
  end
end
