class RenameColumnOccupationToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :occupations, :occupation, :name
  end
end
