class AddPicToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pic, :string
  end
end
