class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_day
      t.date :end_day
      t.integer :total_fee
      t.integer :total_people
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
    add_index :reservations, :room_id
    add_index :reservations, :user_id
  end
end
