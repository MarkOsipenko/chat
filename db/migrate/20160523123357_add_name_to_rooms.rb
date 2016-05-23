class AddNameToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :room_name, :string
  end
end
