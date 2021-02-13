class RenameColumnReasonToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :reasons, :reason, :name
  end
end
