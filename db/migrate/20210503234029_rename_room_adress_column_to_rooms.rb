class RenameRoomAdressColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :room_adress, :room_address
  end
end
