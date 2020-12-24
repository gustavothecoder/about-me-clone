class CreateTableUserReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reasons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reason, null: false, foreign_key: true
      t.string :website
    end
  end
end
