class RemoveColumnDesignId < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_page_designs, :design_id
  end
end
