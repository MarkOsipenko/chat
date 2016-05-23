class CreateUserInRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :user_in_rooms do |t|

      t.timestamps
    end
  end
end
