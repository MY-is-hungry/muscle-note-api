class DailyNote < ApplicationRecord
  validates :content, presence: true
  validates :recorded_on, presence: true, uniqueness: true
  validates :user_id, presence: true, length: { maximum: 48 }
end
