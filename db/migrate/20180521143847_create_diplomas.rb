class CreateDiplomas < ActiveRecord::Migration[5.0]
  def change
    create_table :diplomas do |t|
      t.string :name
      t.string :description
      t.string :isaprooved
      t.string :type
      t.string :group
      t.string :studentid
      t.string :teacherid

      t.timestamps
    end
  end
end
