class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :teacherId
      t.string :type
      t.string :forGroup
      t.string :isActive
      t.string :string

      t.timestamps
    end
  end
end
