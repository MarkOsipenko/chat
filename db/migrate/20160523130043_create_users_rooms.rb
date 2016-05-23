class CreateUsersRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :users_rooms do |t|

      t.timestamps
    end
  end
end
