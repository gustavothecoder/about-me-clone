class AddKeywordsColumnToReasonTable < ActiveRecord::Migration[6.0]
  def change
    add_column :reasons, :keywords, :string
  end
end
