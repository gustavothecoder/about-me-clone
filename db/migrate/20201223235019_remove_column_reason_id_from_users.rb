class RemoveColumnReasonIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :reason_id
  end
end
