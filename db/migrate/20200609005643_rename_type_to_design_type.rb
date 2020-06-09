class RenameTypeToDesignType < ActiveRecord::Migration[6.0]
  def change
    rename_column :designs, :type, :design_type
  end
end
