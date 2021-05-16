class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  
  validates :room_name, :room_introduction, :room_fee, :room_address, presence: true
  validates :room_name,         length: { maximum: 50 }
  validates :room_introduction, length: { maximum: 140 }
  validates :image, attached: true,
                    content_type: { in: %w[image/jpeg image/gif image/png],
                    message: "無効なファイル形式です" },
                    size: { less_than: 5.megabytes,
                    message: "ファイルサイズは5MB未満にしてください" }
                                            
  
  
end
