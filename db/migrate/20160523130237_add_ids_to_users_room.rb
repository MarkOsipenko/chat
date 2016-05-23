class AddIdsToUsersRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :users_rooms, :user_id, :integer
    add_column :users_rooms, :room_id, :integer
  end
end
