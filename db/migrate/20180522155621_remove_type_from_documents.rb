class RemoveTypeFromDocuments < ActiveRecord::Migration[5.1]
  def change
    remove_column :documents, :typee, :string
  end
end
