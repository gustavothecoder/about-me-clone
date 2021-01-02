class RemoveForeignKeyColorId < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_page_designs, :color_id
  end
end
