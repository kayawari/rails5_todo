class Todo < ApplicationRecord
  validates :title, presence: true
  validates :memo,  length: {maximum: 255}
end
