class Todo < ApplicationRecord
  validates :title, presence: true
  validates :memo,  length: {maximum: 255}
  validate :duedate_cannot_be_in_the_past

  # 登録日時より前の日時は登録できない
  def duedate_cannot_be_in_the_past
    if duedate < Date.today
      errors.add(:duedate, "can not be in the past")
    end
  end
end
