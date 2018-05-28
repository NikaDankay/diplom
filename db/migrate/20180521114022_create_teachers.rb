class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :description
      t.string :isActive
      t.string :email
      t.string :password
      t.string :group
      t.string :course

      t.timestamps
    end
  end
end
