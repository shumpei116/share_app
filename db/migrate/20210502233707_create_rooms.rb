class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :room_fee
      t.string :room_adress
      t.string :room_image
      t.references :user

      t.timestamps
    end
  end
end
