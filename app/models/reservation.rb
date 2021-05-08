class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :total_people, presence: true
  validate  :start_end_check

  # 開始日より終了日の方が前だった場合にfalseを返す
  def start_end_check
    if self.start_day && self.end_day
      errors.add(:end_day, "は開始日より前の日付には登録できません。") unless self.start_day <= self.end_day 
    end
  end
end
