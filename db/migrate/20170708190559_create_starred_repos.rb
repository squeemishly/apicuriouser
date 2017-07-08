class CreateStarredRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :starred_repos do |t|
      t.integer :starred_id
      t.string :full_name
      t.references :user, foreign_key: true
    end
  end
end
