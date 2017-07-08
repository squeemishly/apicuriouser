class ChangeFollowersUiDtoInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :followers, :follower_uid
    add_column :followers, :follower_uid, :integer
  end
end
