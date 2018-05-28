class AddIsonlineToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isonline, :string
  end
end
