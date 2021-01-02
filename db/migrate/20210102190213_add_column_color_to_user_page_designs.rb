class AddColumnColorToUserPageDesigns < ActiveRecord::Migration[6.0]
  def change
    add_column :user_page_designs, :color, :int, default: 0
  end
end
