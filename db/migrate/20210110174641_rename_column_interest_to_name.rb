class RenameColumnInterestToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :interests, :interest, :name
  end
end
