class CreateUserReasons < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :reasons do |t|
      t.index :user_id
      t.index :reason_id

      t.timestamps
    end
  end
end
