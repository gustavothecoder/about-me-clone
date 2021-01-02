class DropTableDesigns < ActiveRecord::Migration[6.0]
  def change
    drop_table :designs
  end
end
