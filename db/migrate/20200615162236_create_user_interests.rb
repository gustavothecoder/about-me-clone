class CreateUserInterests < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :interests do |t|
      t.index :user_id
      t.index :interest_id

      t.timestamps
    end
  end
end
