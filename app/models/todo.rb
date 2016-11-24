class Todo < ApplicationRecord
  validates :title, presence: true
  validates :memo,  presence: true, length: {maximum: 256}
end
