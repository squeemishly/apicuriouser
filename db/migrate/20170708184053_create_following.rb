class CreateFollowing < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.string :name
      t.integer :following_id
      t.references :user, foreign_key: true
    end
  end
end
