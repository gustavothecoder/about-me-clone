class AddReasonReferencesToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :reason, null: false, foreign_key: true
  end
end
