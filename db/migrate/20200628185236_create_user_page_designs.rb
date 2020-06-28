class CreateUserPageDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :user_page_designs do |t|
      t.references :user
      t.references :design
      t.references :color

      t.timestamps
    end
  end
end
