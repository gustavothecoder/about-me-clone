class RemoveUserIdFromReasons < ActiveRecord::Migration[6.0]
  def change
    remove_column :reasons, :user_id
  end
end
