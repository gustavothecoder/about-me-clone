class CreateUserOccupations < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :occupations do |t|
      t.index :user_id
      t.index :occupation_id

      t.timestamps
    end
  end
end
