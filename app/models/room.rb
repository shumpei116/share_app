class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  
  validates :room_name, :room_introduction, :room_fee, :room_address, presence: true
  validates :room_name,         length: { maximum: 50 }
  validates :room_introduction, length: { maximum: 140 }
  validates :image,       content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: "must be a valid image format" },
                                  size: { less_than: 5.megabytes,
                                            message: "should be less than 5MB" }
                                            
  def display_image(height,width)
    image.variant(resize: "#{height}x#{width}")
  end
  
end
