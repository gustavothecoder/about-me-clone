class AddColumnDesignToUserPageDesigns < ActiveRecord::Migration[6.0]
  def change
    add_column :user_page_designs, :design, :int, default: 0
  end
end
