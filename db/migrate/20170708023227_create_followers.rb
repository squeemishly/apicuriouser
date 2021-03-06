class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :follower_uid
    end
  end
end
