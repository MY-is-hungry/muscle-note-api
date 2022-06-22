class DailyRecord < ApplicationRecord
  belongs_to :user
  has_many :event_records
end
