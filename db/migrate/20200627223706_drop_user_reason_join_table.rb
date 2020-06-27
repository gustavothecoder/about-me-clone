class DropUserReasonJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :reasons_users
  end
end
