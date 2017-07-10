class Repos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
      t.string :name
      t.integer :repo_uid
      t.references :user, foreign_key: true
    end
  end
end
