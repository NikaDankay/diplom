class AddIsonlineToTachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :isonline, :string
  end
end
