class Room < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :room_name, :room_introduction, :room_fee, :room_address, :room_image, presence: true
  validates :room_name, length: { maximum: 50 }
  validates :room_introduction, length: { maximum: 140 }
end
