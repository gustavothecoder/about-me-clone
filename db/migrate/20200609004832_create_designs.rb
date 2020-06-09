class CreateDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :designs do |t|
      t.string :type

      t.timestamps
    end
  end
end
